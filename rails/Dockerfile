FROM ruby:2.3

MAINTAINER Bruno Pereira <bruno9pereira@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

EXPOSE 3000

##########################################
### INSTALL GIT AND BASIC DEPENDENCIES ###
##########################################
RUN apt-get update && apt-get install -y \
  git \
  git-core \
  curl \
  debconf-utils \
  zlib1g-dev \
  libssl-dev \
  libreadline-dev \
  libyaml-dev \
  libffi-dev \
  libssl-dev \
  vim \
  libsqlite3-dev \
  sqlite3 \
  libxml2-dev \
  libxslt1-dev \
  python-software-properties \
  libcurl4-openssl-dev

RUN apt-get install -y --no-install-recommends software-properties-common build-essential

##############
### NODEJS ###
##############
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs

###############
### MONGODB ###
###############
RUN apt-get install -y mongodb

###################
### GIT CONFIGS ###
###################
RUN git config --global color.ui true

#########################
## INSTALL RAILS 4.2.4 ##
#########################
RUN gem install rails -v 4.2.4

#########################
### INSTALL MYSQL 5.7 ###
#########################
# COPY LOCAL FILE TO DOCKER CONTAINER DIRECTORY AND SET SELECTIONS CONFIG FOR REPOSITORY INSTALLATION
COPY configs/mysql/mysql-config-apt.seed /tmp/mysql-config-apt.seed
RUN debconf-set-selections /tmp/mysql-config-apt.seed

# INSTALL MYSQL 5.7 REPOSITORY AND UPDATE
RUN URL='http://dev.mysql.com/get/mysql-apt-config_0.6.0-1_all.deb'; FILE=mktemp;wget "$URL" -qO $FILE &&  dpkg -i $FILE; rm $FILE
RUN apt-get update

# COPY LOCAL FILE TO DOCKER CONTAINER DIRECTORY AND SET SELECTIONS CONFIG FOR MYSQL 5.7 INSTALLATION
COPY configs/mysql/mysqlconf.seed /tmp/mysqlconf.seed
RUN debconf-set-selections /tmp/mysqlconf.seed

# AND FINALLY INSTALL MYSQL 5.7
RUN apt-get install mysql-server -y


WORKDIR /var/www

COPY startup.sh /usr/bin/startup
RUN chmod +x /usr/bin/startup
CMD /usr/bin/startup