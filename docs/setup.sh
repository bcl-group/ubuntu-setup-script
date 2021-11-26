#!/usr/bin/env bash

export http_proxy=http://proxy.cc.yamaguchi-u.ac.jp:8080
export https_proxy=https://proxy.cc.yamaguchi-u.ac.jp:8080
wget -P /tmp https://bcl-group.github.io/ubuntu-setup-script/ubuntu-setup-script.sh.enc

# Install Ruby
sudo http_proxy=$http_proxy apt update
sudo http_proxy=$http_proxy apt install git gcc make ruby-dev libssl-dev zlib1g-dev whiptail -y
git clone --depth 1 https://github.com/rbenv/rbenv ~/.rbenv
mkdir -p ~/.rbenv/plugins
git clone https://github.com/rbenv/ruby-build ~/.rbenv/plugins/ruby-build
echo -e "\nexport PATH=\"$PATH:$HOME/.rbenv/bin\"\n" >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
rbenv install 3.0.2
rbenv global 3.0.2

gem install specific_install
gem install bcl-group/ubuntu-setup-script dev


# chmod u+x /tmp/dec.sh
# /tmp/dec.sh && chmod u+x /tmp/ubuntu-setup-script.sh && /tmp/ubuntu-setup-script.sh