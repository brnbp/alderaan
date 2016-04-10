FROM debian:jessie

MAINTAINER Bruno Pereira <bruno9pereira@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

EXPOSE 80

##########################################
### INSTALL GIT AND BASIC DEPENDENCIES ###
##########################################
RUN apt-get update && apt-get install -y \
  git \
  git-core \
  curl \
  debconf-utils \
  vim

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
RUN mkdir /data
RUN mkdir /data/db
RUN chmod 755 -R /data

###################
### GIT CONFIGS ###
###################
RUN git config --global color.ui true

WORKDIR /var/www

# startup services
COPY startup.sh /usr/bin/startup

RUN chmod +x /usr/bin/startup
CMD /usr/bin/startup
