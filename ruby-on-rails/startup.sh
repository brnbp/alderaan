#!/bin/sh

service mysql start

bundle install

rails server -b 0.0.0.0

/bin/bash
