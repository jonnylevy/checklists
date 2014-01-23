Making an Apache VHost
======================

### Copy an existing VHost file

~~~
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/my-site.conf
~~~

Edit the new config file with virtual host details for the new site. [Bear](http://pocketrangerblog.com/wp-content/uploads/2013/04/grizzly.jpg) in mind the [new apache config syntax for 2.4+](http://httpd.apache.org/docs/2.4/upgrading.html)

### Enable site

~~~
a2ensite my-site
~~~

### Restart Apache

~~~
service apache2 reload
~~~
