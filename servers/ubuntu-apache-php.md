Setting up your Ubuntu Server
=============================

## The Short Way

run this to run all the automatable stuff on this page.

```
wget -qO- https://raw.github.com/wearearchitect/checklists/master/servers/ubuntu-apache-php.sh | sh
```

You can specify the following options before running this script:

```
# to set the fqdn
export FQDN='serverX.jonnythreescreens.com'
# to set up a user and vhost
export USER='portal'
export DOMAIN='website.com'
# this will set up a user, portal, and a vhost pointing website.com to /home/portal/public
```

## The Long Way

### Installation

Install all the things!

```
sudo apt-get install -y build-essential g++ libssl-dev figlet curl vim git-core ntp ufw php5 apache2 apache2-utils libapache2-mod-php5 mysql-server php5-mysql memcached php5-memcached beanstalkd php5-json php5-curl php5-gd php5-xmlrpc php5-intl php5-mcrypt ruby1.9.1-dev postfix ntp
```

Then make yourself some node (replace 0.10.24 with whatever version of node you want)

```
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
nvm install 0.10.24
nvm alias default 0.10.24
```

Install global node modules

```
sudo npm install -g grunt-cli
sudo npm install -g bower
```

Install ruby gems

```
sudo gem install sass
sudo gem install compass
```

Enable apache and php modules

```
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
```

### Configuration

##### FQDN

Set the server’s fully qualified domain name (FQDN):

Edit `/etc/apache2/httpd.conf`, add:

~~~
ServerName server0.wearearchitect.com
~~~

Edit `/etc/hosts`, add:

~~~
xx.xx.xx.xx server0.wearearchitect.com
xx:xx:xx:xx:xx:xx:xx server0.wearearchitect.com
~~~

##### Firewall

Enable web traffic and SSH:

```
ufw allow http
ufw allow https
ufw allow ssh
```

Now, turn on that firewall!

ufw enable


##### Default Character Set

Edit `/etc/apache2/conf.d/charset`, uncomment:

~~~
AddDefaultCharset utf-8
~~~

##### Time Zones

Set time zone:

~~~
dpkg-reconfigure tzdata
~~~

**NB** London is one hour ahead of UTC in the summer.

Update time:

~~~
ntpdate ntp.ubuntu.com
~~~

And check:

~~~
date
~~~

Start NTP:

~~~
service ntp start
~~~

## [Reboot](http://en.wikipedia.org/wiki/ReBoot)

```
sudo reboot
```
