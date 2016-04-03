FROM ubuntu:15.10

MAINTAINER Bruno Pereira <bruno9pereira@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

##########################################
### INSTALL GIT AND BASIC DEPENDENCIES ###
##########################################
RUN apt-get install && apt-get update -y \
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
  python-software-properties

RUN apt-get install -y --no-install-recommends software-properties-common build-essential libcurl4-openssl-dev

########################
## INSTALL Ruby 2.2.3 ##
########################

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN exec $SHELL

RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
RUN exec $SHELL

RUN git clone https://github.com/rbenv/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

RUN rbenv install 2.2.3
RUN rbenv global 2.2.3

RUN gem install bundler

RUN rbenv rehash

##############
### NODEJS ###
##############
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs

###############
### MONGODB ###
###############
#RUN apt-get install -y mongodb

###################
### GIT CONFIGS ###
###################
RUN git config --global color.ui true
RUN git config --global user.name "Bruno Pereira"
RUN git config --global user.email "bruno9pereira@gmail.com"
RUN ssh-keygen -t rsa -C "bruno9pereira@gmail.com"

# The next step is to take the newly generated SSH key and add it to your Github account.
# You want to copy and paste the output of the following command and paste it here.
RUN cat ~/.ssh/id_rsa.pub

#########################
## INSTALL RAILS 4.2.4 ##
#########################

RUN gem install rails -v 4.2.4
RUN rbenv rehash


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


