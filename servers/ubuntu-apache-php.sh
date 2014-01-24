#! /usr/bin/env bash

# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password secret'
# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password secret'

adduser()
{
	figlet "Adding user: $1"
	sudo useradd -d /home/$1 -m $1
	sudo chown -Rv $1:$1 /home/$1
}

addvhost()
{
	DIRECTORY="$1"
	DOMAIN="$2"

	figlet "Adding site: $DOMAIN as $DIRECTORY"
	vhost="<VirtualHost *:80>
	     ServerName $DOMAIN
	     DocumentRoot /home/$DIRECTORY/public
	     <Directory \"/home/$DIRECTORY/public\">
	          Order allow,deny
	          Allow from all
	          Require all granted
	          AllowOverride All
	    </Directory>
	</VirtualHost>"
	echo "$vhost" | sudo tee /etc/apache2/sites-available/$DIRECTORY.conf
	sudo a2ensite $DIRECTORY
}

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y build-essential g++ libssl-dev figlet curl vim git-core ntp ufw php5 php-pear apache2 apache2-utils libapache2-mod-php5 mysql-server php5-mysql memcached php5-memcached beanstalkd php5-json php5-curl php5-gd php5-xmlrpc php5-intl php5-mcrypt ruby1.9.1-dev postfix

figlet installing node

curl https://raw.github.com/creationix/nvm/master/install.sh | sh
source ~/.profile
nvm install 0.10.24
nvm alias default 0.10.24

figlet node modules

sudo npm install -g grunt-cli
sudo npm install -g bower
sudo npm install -g forever

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

figlet composer

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

figlet phpunit

sudo pear config-set auto_discover 1
sudo pear install pear.phpunit.de/phpunit

figlet generate keys

mkdir -p ~/.ssh
cd ~/.ssh
ssh-keygen -f id_rsa -t rsa -N ''
cd -

if [[ -z "$FQDN" ]]; then
	figlet set FQDN
	echo ServerName $FQDN >> /etc/apache2/apache2.conf
fi

if [[ -n "$USER" && -n "$DOMAIN" ]]; then
	adduser $USER
	addvhost $USER $DOMAIN
fi

figlet beansole

adduser beansole
addvhost "beansole/beanstalk_console" beansole.app
su beansole "git clone https://github.com/ptrofimov/beanstalk_console.git ~/beanstalk_console"

figlet reboot

sudo reboot
