#!/bin/sh
set -e

echo "🌟 Installing ASTRA..."

# platform detection
OS="$(uname -s)"
ARCH="$(uname -m)"

REPO="DrSkyle/ASTRA-Releases"
BASE_URL="https://raw.githubusercontent.com/$REPO/main"

case "$OS" in
    Linux)
        case "$ARCH" in
            x86_64) FILE="astra-linux" ;;
            aarch64|arm64) FILE="astra-linux-aarch64" ;;
            *)
                echo "⚠️  Unsupported Linux architecture: $ARCH. Will attempt source build..."
                FILE="astra-linux-source-fallback" 
                ;;
        esac
        ;;
    Darwin)
        FILE="astra-macos"
        ;;
    *)
        echo "Unsupported OS: $OS"
        exit 1
        ;;
esac

# Download
INSTALL_DIR="/usr/local/bin"
# Check if we have write access to /usr/local/bin, else use local bin
if [ ! -w "$INSTALL_DIR" ]; then
    INSTALL_DIR="$HOME/.local/bin"
    mkdir -p "$INSTALL_DIR"
    # Ensure it's in path
    case ":$PATH:" in
        *":$INSTALL_DIR:"*) ;;
        *)
            echo "Adding $INSTALL_DIR to PATH..."
            echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$HOME/.bashrc"
            echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$HOME/.zshrc"
            ;;
    esac
fi

TARGET="$INSTALL_DIR/astra"

echo "⬇️ Downloading ASTRA ($OS - $ARCH)..."
if curl -# -fL "$BASE_URL/$FILE" -o "$TARGET"; then
    echo "✅ Download successful."
else
    echo "⚠️ Binary not found for $OS-$ARCH. Attempting fallback..."
fi

# Verification & Fallback
needs_build=0
if [ -f "$TARGET" ]; then
    chmod +x "$TARGET"
    # Try running it to check for architecture mismatch (Exec format error)
    if ! "$TARGET" --help >/dev/null 2>&1; then
        echo "⚠️ Downloaded binary is incompatible with your architecture."
        needs_build=1
    fi
else
    needs_build=1
fi

if [ "$needs_build" -eq 1 ]; then
    echo "⚙️  Switching to Source Build Mode..."
    
    if ! command -v cargo >/dev/null 2>&1; then
        echo "❌ Error: Pre-built binary not available and 'cargo' is missing."
        echo "👉 Please install Rust to build from source: https://rustup.rs"
        exit 1
    fi

    # Create temp dir
    TMP_BUILD=$(mktemp -d)
    echo "⬇️  Cloning source code to $TMP_BUILD..."
    
    # Try SSH first (seamless for devs), then HTTPS (interactive fallback)
    if git clone --depth 1 git@github.com:DrSkyle/ASTRA.git "$TMP_BUILD/ASTRA"; then
        echo "✅ Cloned via SSH"
    else
        echo "⚠️ SSH clone failed, trying HTTPS (Auth required)..."
        git clone --depth 1 https://github.com/DrSkyle/ASTRA.git "$TMP_BUILD/ASTRA"
    fi
    
    echo "🔨 Building ASTRA from source (this may take a minute)..."
    cd "$TMP_BUILD/ASTRA"
    if cargo build --release; then
        cp target/release/astra-cli "$TARGET"
        echo "✅ Build successful."
    else
        echo "❌ Build failed."
        exit 1
    fi
    
    # Cleanup
    rm -rf "$TMP_BUILD"
fi


chmod +x "$TARGET"

echo "🚀 Installation Complete!"
echo ""
echo " IMPORTANT: restarting your terminal is required for changes to take effect."
echo " Or run one of these commands explicitly:"
echo "    source ~/.bashrc   # for bash users"
echo "    source ~/.zshrc    # for zsh users"
echo ""
echo "Then run 'astra help' to start."
