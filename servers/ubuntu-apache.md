# Server Commission for Ubuntu & Apache

Notes and checklist for setting up an Ubuntu LAMP server.

| Version | Author         | Notes                          |
| ------- | -------------- | ------------------------------ |
| 1.0.1   | Thomas Edwards | Added PHP Internationalization |
| 1.0.0   | Thomas Edwards | Created file                   |

## Apache

Install:

~~~
apt-get install apache2
~~~

And check.

Enable rewrite module:

~~~
a2enmod rewrite
~~~

Enable SSL module:

~~~
a2enmod ssl
~~~

## PHP

Install PHP, with Apache PHP module:

~~~
apt-get install php5 libapache2-mod-php5
~~~

## MySQL

Install MySQL, with Apache and PHP modules:

~~~
apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
~~~

## Email

Install Postfix:

~~~
apt-get install postfix
~~~

## Git

Install Git:

~~~
apt-get install git-core
~~~

## Libraries

Install GD Library:

~~~
apt-get install php5-gd
~~~

Install cURL, with XML module:

~~~
apt-get install curl php5-curl php5-xmlrpc
~~~

Install Internationalization:

~~~
apt-get install php5-intl
~~~

## HTTP Checklist

### FQDN

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

Remember to use IPv6 if included.

### Default Character Set

Edit `/etc/apache2/httpd.conf`, add:

~~~
AddDefaultCharset utf-8
~~~

### Time Zones

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

Install NTP:

~~~
apt-get install ntp
~~~

Start NTP:

~~~
service ntp start
~~~

### Firewall

Install UFW:

~~~
apt-get install ufw
~~~

Enable web traffic:

~~~
ufw allow http
ufw allow https
~~~

Turn on the firewall:

~~~
ufw enable
~~~

## Authorised Keys

Add your SSH public key to the server so that you don't have to type in the password every time you access the server.

Run locally:

~~~
cat ~/.ssh/id_rsa.pub | ssh root@server "cat >> .ssh/authorized_keys"
~~~

## Final Checklist

Restart the server and check HTTP, and HTTPS if possible.

Check NTP:

~~~
/etc/init.d/ntp status
~~~
