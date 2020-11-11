#!/usr/bin/env bash

wget ubuntu-setup-script.sh.enc
wget dec.sh
./dec.sh && ./ubuntu-setup-script.sh
