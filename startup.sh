#!/bin/sh
 
/etc/init.d/mysql start
/etc/init.d/nginx start
/etc/init.d/php7.0-fpm start

/bin/bash
