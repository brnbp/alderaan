#!/bin/sh
 
/etc/init.d/apache2 stop
/etc/init.d/mysql start
/etc/init.d/nginx start
/bin/bash
