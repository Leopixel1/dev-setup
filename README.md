# Dev Setup

A personal development environment setup script for new PCs (Windows, macOS, and Ubuntu/Debian).
This script automatically installs essential tools and runtimes so you can start developing right away!

## Features

- **Core Utilities**: `git`, `curl`, `wget`, `build-essential`
- **Node.js**: Installed via `nvm` (Node Version Manager) to easily manage versions and avoid permission issues when installing global npm packages.
- **Python**: Installs Python 3 and `pip` (Python package installer).

## Usage

1. Clone this repository (or just download the `setup.sh` script):
   ```bash
   git clone <repository_url>
   cd dev-setup
   ```

2. Make sure the script is executable (macOS/Linux):
   ```bash
   chmod +x setup.sh
   ```

3. Run the setup script:

   **For macOS/Linux or Git Bash (Windows):**
   ```bash
   ./setup.sh
   ```

   **For native Windows (PowerShell):**
   ```powershell
   .\setup.ps1
   ```

4. Once it finishes, restart your terminal or `source ~/.bashrc` (or `~/.zshrc`) to ensure all paths are loaded correctly. For Windows, you may need to run `nvm install lts` and `nvm use lts` after restarting your terminal.
