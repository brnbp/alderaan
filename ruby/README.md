## Docker container for development of ruby projects

### Contains:
- Ruby 2.2.3
- Rails 4.2.4
- NodeJS 5.6
- MongoDB
- MySQL 5.7

### Final Steps

##### And now for the moment of truth. Let's create your first Rails application:

#### If you want to use SQLite (not recommended)
rails new myapp

#### If you want to use MySQL
rails new myapp -d mysql

#### If you want to use Postgres
### Note that this will expect a postgres user with the same username
### as your app, you may need to edit config/database.yml to match the
### user you created earlier
rails new myapp -d postgresql

### Move into the application directory
cd myapp

### If you setup MySQL or Postgres with a username/password, modify the
#### config/database.yml file to contain the username/password that you specified

### Create the database
rake db:create

rails server

# You can now visit http://localhost:3000 to view your new website!




###### you can simple build and run

``` $ docker build -t foo/bar:0.1 . ```

``` $ docker run -i -t foo/bar:0.1 /bin/bash ```

##### or you can just use it from docker registry (I strongly recommend this way, if you don't wanna make any change to dockerfile)
#### ``` $ docker run -it -p 8080:80 brunopereira2546/alderaan:latest /bin/bash ```

##### if you want to mount some dir into container, add the following comand before "startup"
        -v path/host/dir:path/container/dir

> this Dockerfile contains:
  - Ubuntu 15.10 (wily)
  - git
  - php 7.0.3
  - mysql 5.7
  - nginx
  - composer
  - nodejs 5.6 && npm
  - mongodb

###### average time to pulling: 10 minutes
