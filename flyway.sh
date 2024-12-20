#!/bin/bash
wget -qO- https://download.red-gate.com/maven/release/com/redgate/flyway/flyway-commandline/11.1.0/flyway-commandline-11.1.0-linux-x64.tar.gz | tar -xvz && sudo ln -s $(pwd)/flyway-11.1.0/flyway /usr/local/bin
