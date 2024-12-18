#!/bin/bash
# Install trivy

# 1. Add the official Trivy repository:
sudo apt-get install wget -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo "deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list

# 2. Update the package lists and install trivy:
sudo apt-get update
sudo apt-get install trivy -y

# 3. Check the installation:
trivy --version

#============================================================================
# Usage Example
# Once installed, you can start using Trivy to scan images, files, or repositories:
# trivy image nginx:latest       # Scan a Docker image
# trivy filesystem /path/to/dir  # Scan files or directories
# trivy repo https://github.com/inyeza86/3-TIER-Architecture.git  # Scan a git repo
