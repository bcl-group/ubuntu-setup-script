#!/usr/bin/env bash

export http_proxy=http://proxy.cc.yamaguchi-u.ac.jp:8080
export https_proxy=https://proxy.cc.yamaguchi-u.ac.jp:8080
git config --global http.proxy http://proxy.cc.yamaguchi-u.ac.jp:8080
mkdir -p /tmp/docs
rm -f /tmp/docs/ubuntu-setup-script.sh.enc
rm -f /tmp/ubuntu-setup-script.sh
wget -P /tmp/docs https://bcl-group.github.io/ubuntu-setup-script/ubuntu-setup-script.sh.enc

# Install Ruby

export RUBY_BUILD_CURL_OPTS="-k -x http://proxy.cc.yamaguchi-u.ac.jp:8080"
if [ ! -d $HOME/.rbenv ]; then
    sudo http_proxy=$http_proxy apt update
    sudo http_proxy=$http_proxy apt install git gcc make ruby-dev libssl-dev zlib1g-dev whiptail \
        autoconf bison build-essential libyaml-dev libreadline6-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev -y
    
    # rbenv のインストール
    wget -q https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer -O- | bash

    is_rbenv_path=$(cat $HOME/.bashrc | grep PATH | grep rbenv)
    if [[ -z "$is_rbenv_path" ]]; then
        export PATH=$PATH:$HOME/.rbenv/bin
        echo -e "\nexport PATH=\"$PATH:$HOME/.rbenv/bin\"\n" >> ~/.bashrc
        echo 'eval "$(rbenv init -)"' >> ~/.bashrc
        source ~/.bashrc
    fi   
fi

export GEM_HOME=$HOME/.gem
gem install specific_install
gem specific_install https://github.com/bcl-group/ubuntu-setup-script

cd /tmp && $HOME/.gem/bin/bcl-install-decode || exit 1

chmod u+x /tmp/ubuntu-setup-script.sh
/tmp/ubuntu-setup-script.sh
