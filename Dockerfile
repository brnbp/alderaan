### Set Image Ubuntu 15.10
FROM ubuntu:15.10

MAINTAINER Bruno Pereira <bruno9pereira@gmail.com>

RUN apt-get update

ENV DEBIAN_FRONTEND noninteractive

##########################################
### INSTALL GIT AND BASIC DEPENDENCIES ###
##########################################
RUN apt-get install git curl wget debconf-utils -y
RUN apt-get install -y --no-install-recommends software-properties-common build-essential
RUN apt-get install -y g++ libssl-dev vim

#####################
### INSTALL PHP 7 ###
#####################
# ADD REPOSITORY FOR PHP 7
RUN add-apt-repository ppa:ondrej/php -y
RUN apt-get update

# INSTALL PHP 7
RUN apt-get install php7.0 php7.0-mysql php7.0-cgi php7.0-fpm php7.0-curl -y --force-yes

#RUN apt-get install php5 php5-cgi php5-fpm -y

#########################
### INSTALL MYSQL 5.7 ###
#########################
# COPY LOCAL FILE TO DOCKER CONTAINER DIRECTORY AND SET SELECTIONS CONFIG FOR REPOSITORY INSTALLATION
COPY configs/mysql-config-apt.seed /tmp/mysql-config-apt.seed
RUN debconf-set-selections /tmp/mysql-config-apt.seed

# INSTALL MYSQL 5.7 REPOSITORY AND UPDATE
RUN URL='http://dev.mysql.com/get/mysql-apt-config_0.6.0-1_all.deb'; FILE=mktemp;wget "$URL" -qO $FILE &&  dpkg -i $FILE; rm $FILE
RUN apt-get update

# COPY LOCAL FILE TO DOCKER CONTAINER DIRECTORY AND SET SELECTIONS CONFIG FOR MYSQL 5.7 INSTALLATION
COPY configs/mysqlconf.seed /tmp/mysqlconf.seed
RUN debconf-set-selections /tmp/mysqlconf.seed

# AND FINALLY INSTALL MYSQL 5.7
RUN apt-get install mysql-server -y

#####################
### INSTALL NGINX ###
#####################
RUN apt-get install nginx -y

###############
## COMPOSER ###
###############
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer

##############
### NODEJS ###
##############
#RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
#RUN apt-get install -y nodejs

###############
### MONGODB ###
###############
#RUN apt-get install -y mongodb

# startup services
#CMD ["/etc/init.d/nginx start"]
#COPY startup.sh /usr/bin/startup
