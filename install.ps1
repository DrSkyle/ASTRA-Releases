# ASTRA Installer for Windows
$ErrorActionPreference = 'Stop'

Write-Host "🌟 Installing ASTRA..." -ForegroundColor Cyan

# Define GitHub Release URL (Latest)
# note: in a real release, specific version formatting is needed. 
# For now we pull the binary from the latest release or build.
# We will assume a 'releases/download/latest' structure or similar once releases are made.
# For this script to work 'out of the box' before a real release, we might need a direct link.
# Let's use a placeholder that points to the GitHub Releases page for now, 
# or if possible, a direct download if we had one.

$repo = "DrSkyle/ASTRA-Releases"
$url = "https://raw.githubusercontent.com/$repo/main/astra-windows.exe"
$installDir = "$env:LOCALAPPDATA\Siestra\ASTRA"
$exePath = "$installDir\astra.exe"

# Create Directory
if (!(Test-Path $installDir)) {
    New-Item -ItemType Directory -Force -Path $installDir | Out-Null
}

$needsBuild = $false
try {
    Write-Host "⬇️ Downloading ASTRA binary..."
    Invoke-WebRequest -Uri $url -OutFile $exePath -ErrorAction Stop
} catch {
    Write-Host "⚠️ Binary download failed. Attempting fallback..." -ForegroundColor Yellow
    $needsBuild = $true
}

# Verify validity (if download succeeded)
if (-not $needsBuild) {
    if ((Get-Item $exePath).Length -lt 1KB) {
        $needsBuild = $true
    }
}

# Fallback: Build from Source
if ($needsBuild) {
    Write-Host "⚙️ Switching to Source Build Mode..." -ForegroundColor Cyan
    
    # Check for Rust
    if (!(Get-Command "cargo" -ErrorAction SilentlyContinue)) {
        Write-Host "❌ Error: Pre-built binary unavailable and Rust (cargo) is missing." -ForegroundColor Red
        Write-Host "👉 Please install Rust to proceed: https://rustup.rs"
        Exit 1
    }

    $tmpDir = Join-Path $env:TEMP "ASTRA_Build_$(Get-Random)"
    New-Item -ItemType Directory -Path $tmpDir -Force | Out-Null
    
    Write-Host "⬇️ Cloning source code..."
    try {
        git clone --depth 1 git@github.com:DrSkyle/ASTRA.git "$tmpDir\ASTRA"
    } catch {
        Write-Host "⚠️ SSH Clone failed, trying HTTPS..."
        git clone --depth 1 https://github.com/DrSkyle/ASTRA.git "$tmpDir\ASTRA"
    }

    Write-Host "🔨 Building ASTRA (This may take a minute)..."
    Set-Location "$tmpDir\ASTRA"
    cargo build --release
    
    # Move binary
    Copy-Item "target\release\astra-cli.exe" -Destination $exePath -Force
    
    # Cleanup
    Set-Location $env:USERPROFILE
    Remove-Item $tmpDir -Recurse -Force
    Write-Host "✅ Build Success." -ForegroundColor Green
}

# Add to PATH
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($userPath -notlike "*$installDir*") {
    [Environment]::SetEnvironmentVariable("Path", "$userPath;$installDir", "User")
    Write-Host "✅ Added ASTRA to PATH." -ForegroundColor Green
}

Write-Host "🚀 Installation Complete! Please restart your terminal and run 'astra help'." -ForegroundColor Green
