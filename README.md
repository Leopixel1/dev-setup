# Dev Setup

A personal development environment setup script for new PCs (macOS and Ubuntu/Debian).
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

2. Make sure the script is executable:
   ```bash
   chmod +x setup.sh
   ```

3. Run the setup script:
   ```bash
   ./setup.sh
   ```

4. Once it finishes, restart your terminal or `source ~/.bashrc` (or `~/.zshrc`) to ensure all paths are loaded correctly.
