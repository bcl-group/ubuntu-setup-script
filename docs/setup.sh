#!/usr/bin/env bash

wget https://bcl-group.github.io/ubuntu-setup-script/dec.sh
wget https://bcl-group.github.io/ubuntu-setup-script/ubuntu-setup-script.sh.enc
chmod u+x dec.sh
chmod u+x ubuntu-setup-script.sh
./dec.sh && ./ubuntu-setup-script.sh