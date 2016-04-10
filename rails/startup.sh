#!/bin/bash

if [ -e Gemfile ]
then
  /etc/init.d/mongodb start
  service mysql start
  bundle install
  rails s -b 0.0.0.0
fi

/bin/bash
