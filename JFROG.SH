#!/bin/sh
sudo wget -O jfrog-deb-installer.tar.gz "https://releases.jfrog.io/artifactory/jfrog-prox/org/artifactory/pro/deb/jfrog-platform-trial-prox/[RELEASE]/jfrog-platform-trial-prox-[RELEASE]-deb.tar.gz"
sudo tar -xvzf jfrog-deb-installer.tar.gz
cd jfrog-platform-trial-pro*
sudo ./install.sh
sudo systemctl start artifactory.service
sudo systemctl start xray.service
