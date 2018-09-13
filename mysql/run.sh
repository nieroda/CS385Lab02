#!/bin/sh

service mysql start

cat minibank.sql | mysql -u root
echo "show databases" | mysql -u root
service mysql stop
#sleep 999999999
#mysql -u root
#apachectl -D FOREGROUND
