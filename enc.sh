#!/usr/bin/env bash

bcl_pass=$(whiptail --passwordbox "パスワードを入力してください\\n(Gr*********)" 10 0 3>&1 1>&2 2>&3)
openssl aes-256-cbc -e -in ubuntu-setup-script.sh -out ubuntu-setup-script.sh.enc -pass pass:$bcl_pass -iter 1024

