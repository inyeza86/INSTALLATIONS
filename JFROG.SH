#!/bin/sh
sudo apt update
sudo apt install -y openjdk-17-jdk maven git jq net-tools
sudo wget -O jfrog-deb-installer.tar.gz "https://releases.jfrog.io/artifactory/jfrog-prox/org/artifactory/pro/deb/jfrog-platform-trial-prox/[RELEASE]/jfrog-platform-trial-prox-[RELEASE]-deb.tar.gz"
sudo tar -xvzf jfrog-deb-installer.tar.gz
cd jfrog-platform-trial-pro*
sudo ./install.sh
sudo systemctl start artifactory.service
sudo systemctl start xray.service

# Access it on port 8082.
# create a trial licence  (https://r.search.yahoo.com/_ylt=AwrFSW3YPppnjwIAGwBXNyoA;_ylu=Y29sbwNiZjEEcG9zAzEEdnRpZAMEc2VjA3Ny/RV=2/RE=1739371480/RO=10/RU=https%3a%2f%2fjfrog.com%2fstart-free%2f/RK=2/RS=Bw5QU4_iJPNt3yCXCblIGE_XMwA-)
