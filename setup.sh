#!/bin/bash

# Exit on error
set -e

echo "Starting development environment setup..."

# Function to check the OS
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Check if it's Ubuntu/Debian
        if [ -f /etc/debian_version ]; then
            OS="ubuntu"
        else
            echo "Unsupported Linux distribution. This script supports Ubuntu/Debian."
            exit 1
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
    elif [[ "$OSTYPE" == "msys"* ]] || [[ "$OSTYPE" == "cygwin"* ]] || [[ "$OSTYPE" == "win32"* ]]; then
        OS="windows"
    else
        echo "Unsupported OS: $OSTYPE"
        exit 1
    fi
}

detect_os

if [ "$OS" == "ubuntu" ]; then
    echo "Detected Ubuntu/Debian."

    echo "Updating package lists..."
    sudo DEBIAN_FRONTEND=noninteractive apt-get update -y

    echo "Installing core utilities..."
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y git curl wget build-essential

    echo "Installing Python 3 and pip..."
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip python3-venv

elif [ "$OS" == "macos" ]; then
    echo "Detected macOS."

    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Add brew to path for the current session (might need adjustments based on Apple Silicon/Intel)
        if [[ $(uname -m) == 'arm64' ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        else
            eval "$(/usr/local/bin/brew shellenv)"
        fi
    else
        echo "Homebrew is already installed. Updating..."
        brew update
    fi

    echo "Installing core utilities..."
    brew install git curl wget

    echo "Installing Python 3..."
    brew install python

elif [ "$OS" == "windows" ]; then
    echo "Detected Windows."

    if ! command -v winget &> /dev/null; then
        echo "winget not found. Please install App Installer from the Microsoft Store."
        exit 1
    fi

    echo "Installing core utilities..."
    winget install --id Git.Git -e --source winget --accept-source-agreements --accept-package-agreements
    # Windows already has curl, but we install wget via winget
    winget install --id JernejSimoncic.Wget -e --source winget --accept-source-agreements --accept-package-agreements

    echo "Installing Python 3..."
    winget install --id Python.Python.3.12 -e --source winget --accept-source-agreements --accept-package-agreements

    echo "Installing NVM for Windows..."
    winget install --id CoreyButler.NVMforWindows -e --source winget --accept-source-agreements --accept-package-agreements
fi

if [ "$OS" == "windows" ]; then
    echo "Development environment setup complete!"
    echo "IMPORTANT: Please restart your terminal to ensure all paths are loaded correctly."
    echo "For Windows, NVM is installed via nvm-windows. Run 'nvm install lts' after restarting."
    exit 0
fi

# Install NVM and Node.js
echo "Installing NVM (Node Version Manager)..."
if [ ! -d "$HOME/.nvm" ]; then
    # Download and run the install script for NVM
    export NVM_DIR="$HOME/.nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

    # Load NVM in the current session
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
else
    echo "NVM is already installed."
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

echo "Installing latest LTS version of Node.js..."
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

echo "Development environment setup complete!"
echo "IMPORTANT: Please restart your terminal or run 'source ~/.bashrc' (or ~/.zshrc) to ensure all paths (like nvm) are loaded correctly."
