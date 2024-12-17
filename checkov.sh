#!/bin/bash
# This script will install checkov which it is an open source tool to scan IAC for security issues.
# This script will install checkov in your local machine.
# Prerequisites: make sure python3 is installed in your local machine.
# Usage: ./install-checkov.sh

# METHOD 1: Install Checkov via pip (Python Package Installer): the most straightforward method if pythos is already installed
# Advantages: Easy to install and manage with pip and Suitable for most scenarios where Python is already available.
# Update system packages:
sudo apt update && sudo apt upgrade -y

# Install Python and pip (if not already installed):
sudo apt install python3 python3-pip -y

# Install Checkov via pip
pip install checkov

# Verify Checkov installation
checkov --version

# METHOD 2: Install Checkov via Python Virtual Environment (Python Virtual Environment): if you want to install checkov in a virtual environment
# Advantages: Keeps Checkov isolated from the global Python environment. Useful for environments requiring strict dependency management.
# Update system packages and install Python3 and pip3 and venv(you can specify the version you want like this:python3.12-venv)
sudo apt update -y && sudo apt upgrade -y
sudo apt install python3-pip python3-venv -y
pip3 --version

# Create a virtual environment
python3 -m venv ~/.checkov_env

# Activate the virtual environment
source ~/.checkov_env/bin/activate

# Install Checkov
pip install checkov

# Verify Checkov installation
checkov --version

# Deactivate the virtual environment
#deactivate

# METHOD 3: Install Checkov via Docker
# Update system packages and install Docker
sudo apt update -y && sudo apt upgrade -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
docker --version

# Run Checkov container
docker run -it --rm -v "$(pwd):/workdir" bridgecrew/checkov --directory /workdir

# METHOD 4: Install Checkov via GitHub Releases
# Advantages: Portable; no dependencies required and Can be run on systems without Python installed.
# Download the latest release from GitHub
curl -L -o checkov https://github.com/bridgecrewio/checkov/releases/latest/download/checkov_$(uname -s)_$(uname -m)

# Make the binary executable
chmod +x checkov

# Move the binary to a directory in your PATH
sudo mv checkov /usr/local/bin
checkov --version

# METHOD 5: Install Checkov via pipx(Isolated Python Environment)
# Advantages: Keeps Checkov isolated from the global Python environment. Avoids dependency conflicts with other Python applications.
# Install pipx
sudo apt install python3-pip -y
pip3 install pipx
pipx ensurepath

# Install Checkov via pipx
pipx install checkov

# Verify Checkov installation
checkov --version

# METHOD 6: Install Checkov Using apt Package Manager (via Bridgecrew Repository)
# Advantages: Managed installation via apt for easier upgrades and maintenance. No need for Python installation on the system.
# Update system packages
sudo apt update -y && sudo apt upgrade -y

# Add Bridgecrew GPG Key:
curl -s https://keyserver.ubuntu.com/pks/lookup?op=get &
search=0xE83E9E9E42318C18 | sudo apt-key add -

# Add Bridgecrew Repository:
echo "deb https://ppa.bridgecrew.io stable main" | sudo tee /etc/apt/sources.list.d/bridgecrew.list

# Update package lists:
sudo apt update -y

# Install Checkov:
sudo apt install checkov -y

# Verify Checkov installation:
checkov --version

# Recommended Method
# Use pip if Python is already installed and you want simplicity.
# Use Docker or the standalone binary if you want portability and to avoid installing dependencies on the host.
# Use apt if you prefer system-managed installations.
# Use pipx or venv if you need isolation to prevent dependency conflicts.
