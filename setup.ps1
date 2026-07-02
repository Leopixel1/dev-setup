# Exit on error (equivalent to set -e in bash)
$ErrorActionPreference = "Stop"

Write-Host "Starting development environment setup for Windows..."

# Check if winget is available
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "winget not found. Please install App Installer from the Microsoft Store."
    exit 1
}

Write-Host "Installing core utilities (Git, Wget)..."
winget install --id Git.Git -e --source winget --accept-source-agreements --accept-package-agreements
# Windows has curl via an alias to Invoke-WebRequest usually, but we install Wget
winget install --id JernejSimoncic.Wget -e --source winget --accept-source-agreements --accept-package-agreements

Write-Host "Installing Python 3..."
winget install --id Python.Python.3.12 -e --source winget --accept-source-agreements --accept-package-agreements

Write-Host "Installing NVM for Windows..."
winget install --id CoreyButler.NVMforWindows -e --source winget --accept-source-agreements --accept-package-agreements

Write-Host "Development environment setup complete!"
Write-Host "IMPORTANT: Please restart your terminal to ensure all paths are loaded correctly."
Write-Host "Once restarted, you can install the latest LTS version of Node.js by running:"
Write-Host "  nvm install lts"
Write-Host "  nvm use lts"
