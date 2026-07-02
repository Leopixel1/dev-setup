# Exit on error (equivalent to set -e in bash)
$ErrorActionPreference = "Stop"

Write-Host "Starting development environment setup for Windows..."

# Check if winget is available
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "winget not found. Please install App Installer from the Microsoft Store."
    exit 1
}

Write-Host "Installing core utilities (Git, Wget)..."
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    winget install --id Git.Git -e --source winget --accept-source-agreements --accept-package-agreements
} else {
    Write-Host "Git is already installed."
}

# Windows has curl via an alias to Invoke-WebRequest usually, but we install Wget
if (-not (Get-Command wget -ErrorAction SilentlyContinue)) {
    winget install --id JernejSimoncic.Wget -e --source winget --accept-source-agreements --accept-package-agreements
} else {
    Write-Host "Wget is already installed."
}

Write-Host "Installing Python 3..."
if (-not (Get-Command python -ErrorAction SilentlyContinue) -and -not (Get-Command python3 -ErrorAction SilentlyContinue)) {
    winget install --id Python.Python.3.12 -e --source winget --accept-source-agreements --accept-package-agreements
} else {
    Write-Host "Python is already installed."
}

Write-Host "Installing NVM for Windows..."
if (-not (Get-Command nvm -ErrorAction SilentlyContinue)) {
    winget install --id CoreyButler.NVMforWindows -e --source winget --accept-source-agreements --accept-package-agreements
} else {
    Write-Host "NVM is already installed."
}

Write-Host "Development environment setup complete!"
Write-Host "IMPORTANT: Please restart your terminal to ensure all paths are loaded correctly."
Write-Host "Once restarted, you can install the latest LTS version of Node.js by running:"
Write-Host "  nvm install lts"
Write-Host "  nvm use lts"
