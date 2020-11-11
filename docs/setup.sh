#!/usr/bin/env bash

wget -P /tmp https://bcl-group.github.io/ubuntu-setup-script/dec.sh
wget -P /tmp https://bcl-group.github.io/ubuntu-setup-script/ubuntu-setup-script.sh.enc
chmod u+x /tmp/dec.sh
/tmp/dec.sh && chmod u+x /tmp/ubuntu-setup-script.sh && /tmp/ubuntu-setup-script.sh