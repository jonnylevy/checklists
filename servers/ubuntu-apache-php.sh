#! /usr/bin/env bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y build-essential g++ libssl-dev figlet curl vim git-core ntp ufw php5 apache2 apache2-utils libapache2-mod-php5 mysql-server php5-mysql memcached php5-memcached beanstalkd php5-json php5-curl php5-gd php5-xmlrpc php5-intl php5-mcrypt ruby1.9.1-dev postfix

figlet installing node

curl https://raw.github.com/creationix/nvm/master/install.sh | sh
source ~/.profile
nvm install 0.10.24
nvm alias default 0.10.24

figlet node modules

sudo npm install -g grunt-cli
sudo npm install -g bower


figlet "compass & sass"

sudo gem install sass --no-ri --no-rdoc
sudo gem install compass --no-ri --no-rdoc

figlet enable mods

a2enmod rewrite
a2enmod ssl
php5enmod mcrypt
php5enmod mysql
php5enmod memcached
php5enmod json
php5enmod curl
php5enmod gd
php5enmod xmlrpc
php5enmod intl

figlet firewall

ufw allow http
ufw allow https
ufw allow ssh

ufw enable

figlet ntp

ntpdate ntp.ubuntu.com
service ntp start


figlet reboot

sudo reboot
