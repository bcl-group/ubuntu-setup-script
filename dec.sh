#!/usr/bin/env bash

export NEWT_COLORS='
window=,white
border=,white
textbox=,white
button=,gray
'

which whiptail 2>/dev/null 1>/dev/null || (sudo -E apt update && sudo -E apt install whiptail -y)

bcl_pass=$(whiptail --passwordbox "パスワードを入力してください\\n(Gr*********)" 10 0 3>&1 1>&2 2>&3)

openssl aes-256-cbc -d -in ubuntu-setup-script.sh.enc -out ubuntu-setup-script.sh -pass pass:$bcl_pass -iter 1024 2>/dev/null
if [[ $? -ne 0 ]]; then
    whiptail --msgbox パスワードが間違っています 0 0
    exit 1
else
    echo OK
    exit 0
fi