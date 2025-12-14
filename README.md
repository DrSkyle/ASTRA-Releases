# ASTRA: The Code Intelligence App

**By Siestra**

# 🌌 ASTRA: Abstract Syntax Tree Risk Analyzer

![Build](https://img.shields.io/badge/build-passing-brightgreen) ![Risk](https://img.shields.io/badge/Risk-Protected-blue) ![AI](https://img.shields.io/badge/AI-Enabled-purple) ![License](https://img.shields.io/badge/license-MIT-green)

> _The "F-16 Fighter Jet" of Static Analysis._ It doesn't just read your code; it understands the _cost_ and _risk_ of every line.

![ASTRA Logo](assets/logo.png)

## Why ASTRA?

Most static analysis tools are dumb. They grep for strings. ASTRA builds a complete semantic graph of your entire software architecture to answer the questions that matter to CTOs and Lead Devs:

- **☢️ Blast Radius**: If I touch `utils.rs`, how many files break? (Impact Analysis)
- **🧟 Zombie Code**: What code are we paying to maintain that is _never called_? (Efficiency)
- **👔 Executive Report**: A "Boardroom Ready" HTML dashboard with a single Health Score (0-100).
- **🧠 Neural Interface**: Interactive D3.js visualization of your code's brain.

### Supported Languages (v1.1.0)

ASTRA Hyper-Intelligence Engine currently supports deep semantic analysis for:

| Tier 1 (Systems) | Tier 2 (Web)      | Tier 3 (Config) |
| :--------------- | :---------------- | :-------------- |
| 🦀 **Rust**      | 🟦 **TypeScript** | 📜 **JSON**     |
| 🐍 **Python**    | 🟨 **JavaScript** | 📄 **YAML**     |
| 🐹 **Go**        | ☕ **Java**       | 🐚 **Bash**     |
| ⚡ **C++**       | ⚛️ **HTML/CSS**   | 🐘 **Kotlin**   |

_(Tier 4 support for C#, Ruby, Swift, PHP, Solidity, and SQL arriving in v1.2)_

## Features & Pricing

| Feature                         | Indie (Free / $4.99) | Pro ($14.99) |
| :------------------------------ | :------------------: | :----------: |
| **Basic Audit**                 |          ✅          |      ✅      |
| **Zombie Code Detection**       |          ✅          |      ✅      |
| **CLI Output**                  |          ✅          |      ✅      |
| **Blast Radius Analysis**       |          ❌          |      ✅      |
| **Deep Semantics (12 Langs)**   |          ✅          |      ✅      |
| **Git Forensics (The Prophet)** |          ❌          |      ✅      |
| **The Holodeck (3D Report)**    |      🔒 Locked       |      ✅      |
| **The Gatekeeper (CI/CD)**      |      🔒 Locked       |      ✅      |
| **The CFO (Dynamic Debt)**      |      🔒 Locked       |      ✅      |
| **The Purist (AST Complexity)** |      🔒 Locked       |      ✅      |
| **The Doppelgänger (Dupes)**    |      🔒 Locked       |      ✅      |
| **The Time Machine (Trends)**   |      🔒 Locked       |      ✅      |
| **The League (Gamification)**   |      🔒 Locked       |      ✅      |
| **The Cortex (Local AI)**       |      🔒 Locked       |      ✅      |
| **The Architect (AI Reports)**  |      🔒 Locked       |      ✅      |
| **The Summoner (Auto-Install)** |      🔒 Locked       |      ✅      |

---

## Installation

ASTRA is a standalone CLI application. It runs locally on your machine—your code never leaves your computer.

### Quick Install (Mac / Linux / Windows)

One command to rule them all. Detects your OS, verifies architecture, and automatically builds from source if a pre-compiled binary is incompatible (e.g., ARM64 Linux).

**Linux / macOS**
```bash
curl -fsSL https://raw.githubusercontent.com/DrSkyle/ASTRA-Releases/main/install.sh | sh
```
*Supports: x86_64, aarch64 (M1/M2/M3), ARMv7*

**Windows (PowerShell)**
```powershell
iwr https://raw.githubusercontent.com/DrSkyle/ASTRA-Releases/main/install.ps1 -useb | iex
```

### Windows (PowerShell)

```powershell
iwr https://raw.githubusercontent.com/DrSkyle/ASTRA-Releases/main/install.ps1 -useb | iex
```

### Build from Source

This repository contains only binary releases. The source code is hosted privately.
If you have access, you can clone it from:

```bash
git clone git@github.com:DrSkyle/ASTRA.git
```

### Uninstall

To remove ASTRA from your system:

```bash
# Linux / macOS
rm ~/.local/bin/astra /usr/local/bin/astra 2>/dev/null

# Windows (PowerShell)
rm $env:LOCALAPPDATA\Siestra\ASTRA\astra.exe
```

---

## Usage

### 1. Scan Your Code

Go to any project folder and run:

```bash
astra scan
```

This will generate a quick terminal summary of your project's health.

### 2. Upgrade to Pro

To unlock the **Neural Interface** and **Executive Report**, buy a license:

```bash
astra buy
```

# 2. Ask The Oracle

astra ask "Why is the Risk Score so low?"

# 3. The Architect (AI Executive Summary)

# Automatically embedded in the HTML report when Ollama is active.

astra scan --html

### 4. The Neural Link (VS Code Extension)

Real-time risk analysis as you type.

1. Install the Extension manually or via VS Code marketplace (coming soon).
2. Press `F5` to investigate your code in real-time.

### 5. Activate License

Once you have your key (check your email), unlock the power:

```bash
astra activate sk_YOUR_KEY_HERE
```

### 5. Configure Financials ("The CFO")

Tell ASTRA how much you pay your developers to get accurate debt calculations:

```bash
astra config
# Prompts for: Currency, Hourly Rate, and Time-to-Fix estimates.
```

### 5. Generate Holodeck Report ("Genius Mode")

Visualize your codebase as a 3D neural network. Files that change often and are complex will **pulse red** (Hotspot Analysis):

```bash
astra scan --html --output report.pdf
```

_Opens `astra-report.html` in your browser._

### 6. Set up CI/CD ("The Gatekeeper")

Generate a GitHub Actions workflow to auto-fail builds if risk is too high:

```bash
astra init
```

Now you can generate the "Future-Glass" dashboard:

```bash
astra scan --output ./report.html
```

Open `report.html` in your browser to see your Neural Interface.

---

## License

Copyright © 2025 Siestra. All Rights Reserved.
Powered by Freemius.
