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

## GitHub Actions & Self-Hosted Runners

This project can be used to automatically provision GitHub Actions self-hosted runners or as part of a CI pipeline to ensure a consistent environment.

### Auto Deployment / Provisioning

To use these scripts in a GitHub Actions workflow (e.g., for a self-hosted runner), you can add a step to your workflow:

```yaml
jobs:
  provision:
    runs-on: self-hosted
    steps:
      - uses: actions/checkout@v4
      - name: Run Setup Script
        run: |
          chmod +x setup.sh
          ./setup.sh
```

### Continuous Integration

The scripts are automatically tested on every push to the `main` branch across Ubuntu, macOS, and Windows. Check the `.github/workflows/ci.yml` file for the exact implementation.

### Manual Setup for Runners

If you are setting up a new machine as a self-hosted runner:
1. Follow the standard installation steps above.
2. Register the runner on GitHub.
3. The scripts ensure that `git`, `node`, `npm`, and `python` are available for your CI jobs.
