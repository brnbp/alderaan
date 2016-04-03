### Docker container for development of ruby projects

> this Dockerfile contains:
  - Ubuntu 15.10 (wily)
  - Git
  - Ruby 2.2.3
  - Rails 4.2.4
  - NodeJS 5.6 && npm
  - MongoDB
  - MySQL 5.7

###### average time to pulling: 10 minutes


###### you can simple build and run

``` $ docker build -t foo/bar:0.1 . ```

``` $ docker run -i -t foo/bar:0.1 /bin/bash ```

##### or you can just use it from docker registry (I strongly recommend this way, if you don't wanna make any change to dockerfile)
#### ``` $ docker run -it -p 8080:80 brunopereira2546/ruby:latest /bin/bash ```

##### if you want to mount some dir into container, add the following comand before "startup"
        -v path/host/dir:path/container/dir



####### Final Steps

###### Let's create your first Rails application:

###### If you want to use MySQL
###### rails new myapp -d mysql

##### Move into the application directory
cd myapp

##### If you setup MySQL with a username/password, modify the
###### config/database.yml file to contain the username/password that you specified

##### Create the database
###### rake db:create

###### rails server

###### You can now visit http://localhost:3000 to view your website!

