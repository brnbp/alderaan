#!/bin/sh

if [ -e Gemfile ] then
service mysql start
bundle install
rails server -b 0.0.0.0
fi

/bin/bash
