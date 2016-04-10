#!/bin/sh

chmod 755 -R /var/www
chmod -R o+w /var/www/storage
 
/etc/init.d/mongodb start
/etc/init.d/mysql start
/etc/init.d/nginx start
/etc/init.d/php7.0-fpm start

/bin/bash
