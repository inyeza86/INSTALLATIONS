#!/bin/bash
# Install TFsec
curl -s https://raw.githubusercontent.com/aquasecurity/tfsec/master/scripts/install.sh | bash

# verify tfsec
tfsec --version
