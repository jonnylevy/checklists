# Server Commission for Ubuntu & Apache

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

## HTTP Checklist

### FQDN

Set the server’s fully qualified domain name (FQDN):

Edit `/etc/apache2/httpd.conf`, add:

~~~
ServerName server0.wearearchitect.com
~~~

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

Update time:

~~~
ntpdate ntp.ubuntu.com
~~~

And check:

~~~
date
~~~

## Authorised Keys

Add your SSH public key to the server so that you don't have to type in the password every time you access the server.

Run locally:

~~~
cat ~/.ssh/id_rsa.pub | ssh root@server "cat >> .ssh/authorized_keys"
~~~

