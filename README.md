###### you can simple build and run

``` $ docker build -t foo/bar:0.1 . ```

``` $ docker run -i -t foo/bar:0.1 /bin/bash ```

##### or you can just use it from docker registry (I strongly recommend this way, if you don't wanna make any change to dockerfile)
#### ``` $ docker run -it -p 8080:80 brunopereira2546/alderaan:latest  startup ```

##### if you want to mount some dir into container, add the following comand before "startup"
        -v path/host/dir:path/container/dir

> this Dockerfile contains:
  - Ubuntu 15.10 (wily)
  - git
  - php 7.0
  - mysql 5.7
  - nginx
  - composer
  - nodejs 5.5 && npm
  - mongodb

###### average time to pulling: 10 minutes
