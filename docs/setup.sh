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
    git clone --depth 1 https://github.com/rbenv/rbenv ~/.rbenv
    mkdir -p ~/.rbenv/plugins
    # git clone https://github.com/rbenv/ruby-build ~/.rbenv/plugins/ruby-build
    export PATH=$PATH:$HOME/.rbenv/bin
    echo -e "\nexport PATH=\"$PATH:$HOME/.rbenv/bin\"\n" >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source ~/.bashrc
fi
cd ~/.rbenv && git pull origin master
ruby_versions=$(~/.rbenv/bin/rbenv install -l 2>/dev/null)
ruby_version=`echo $ruby_versions | cut -d " " -f 3`
~/.rbenv/bin/rbenv install ${ruby_version} -s
eval "$(~/.rbenv/bin/rbenv init -)"
~/.rbenv/bin/rbenv global ${ruby_version}

gem install specific_install
gem specific_install https://github.com/bcl-group/ubuntu-setup-script

cd /tmp && bcl-install-decode || exit 1

chmod u+x /tmp/ubuntu-setup-script.sh
/tmp/ubuntu-setup-script.sh
