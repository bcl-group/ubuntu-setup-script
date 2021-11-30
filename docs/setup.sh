#!/usr/bin/env bash

export http_proxy=http://proxy.cc.yamaguchi-u.ac.jp:8080
export https_proxy=https://proxy.cc.yamaguchi-u.ac.jp:8080
git config --global http.proxy http://proxy.cc.yamaguchi-u.ac.jp:8080
mkdir -p /tmp/docs
wget -P /tmp/docs https://bcl-group.github.io/ubuntu-setup-script/ubuntu-setup-script.sh.enc

# Install Ruby

if [ ! -d $HOME/.rbenv ]; then
    sudo http_proxy=$http_proxy apt update
    sudo http_proxy=$http_proxy apt install git gcc make ruby-dev libssl-dev zlib1g-dev whiptail -y
    git clone --depth 1 https://github.com/rbenv/rbenv ~/.rbenv
    mkdir -p ~/.rbenv/plugins
    git clone https://github.com/rbenv/ruby-build ~/.rbenv/plugins/ruby-build
    export PATH=$PATH:$HOME/.rbenv/bin
    echo -e "\nexport PATH=\"$PATH:$HOME/.rbenv/bin\"\n" >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source ~/.bashrc
    export RUBY_BUILD_CURL_OPTS="-k -x http://proxy.cc.yamaguchi-u.ac.jp:8080"
    rbenv install 3.0.3
    rbenv global 3.0.3
else
    rbenv install 3.0.3 -s
    eval "$(rbenv init -)"
    rbenv global 3.0.3
fi

gem install specific_install
gem specific_install bcl-group/ubuntu-setup-script dev

cd /tmp && bcl-install-decode || exit 1

chmod u+x /tmp/ubuntu-setup-script.sh
/tmp/ubuntu-setup-script.sh
