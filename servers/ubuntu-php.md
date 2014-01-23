Firstly, install everything that apt-get can install

```
sudo apt-get install -y build-essential g++ libssl-dev curl vim git-core ntp ufw php5 apache2 apache2-utils libapache2-mod-php5 mysql-server php5-mysql memcached php5-memcached beanstalkd php5-json php5-curl php5-gd php5-xmlrpc php5-intl php5-mcrypt ruby1.9.1-dev postfix
```

Then make node (nb - the make takes 10-15 mins - either run this in the background `make &` or open up another shell)

```
git clone git://github.com/ry/node.git
cd node
./configure
make
sudo make install
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
