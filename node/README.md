### Docker container for development of ruby on rails projects
--------

> this Dockerfile contains:
  - Ubuntu 15.10 (wily)
  - Git
  - Ruby 2.2.3
  - Rails 4.2.4
  - NodeJS 5.6 && npm
  - MongoDB
  - MySQL 5.7

###### average time to pulling: 10 minutes

----


###### you can simple clone this repo and run

``` $ docker build -t foo/bar:0.1 . ```

``` $ docker run -v /path/host/rails-project:/var/www -p 8080:3000 -i -t foo/bar:0.1 ```

##### or you can just use it from docker registry

``` $ docker run -v /path/host/rails-project:/var/www -p 8080:3000 -it brunopereira2546/ruby:latest ```


--------

###### You can now visit 127.0.0.1:8080 to view your application running!

