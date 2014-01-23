Adding a UNIX User
==================

#### Create that user!

~~~
useradd -d /home/username -m username
~~~

#### Create a password

NB. If you do not set this, you will only be able to log into this user from sudo. So only set a password if you will need to SFTP in, or need to ssh directly into the user's shell.

~~~
passwd username
~~~

You will then be asked to set the password twice.

#### Set permissions

~~~
chown -Rv username:username /home/username
~~~

#### Once more, with feeling

for one batch script, just replace user with your username. Omit the last line for a passwordless user

```
USER_NAME='ronald'
useradd -d /home/$USER_NAME -m $USER_NAME
chown -Rv $USER_NAME:$USER_NAME /home/$USER_NAME
passwd $USER_NAME
```
