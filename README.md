#### this 
you can simple build and run
``` $ docker build -t foo/bar:0.1 . ```

``` $ docker run -i -t foo/bar:0.1 /bin/bash ```

or you can just use it from docker registry (I strongly recommend this way, if you don't wanna make any change to dockerfile)
``` $ docker run -i -t brunopereira2546/alderaan:latest -p 8080:80 startup ```

> this Dockerfile contains:
  - Ubuntu 15.10 (wily)
  - git
  - php 7.0
  - mysql 5.7
  - nginx
  - composer
  - nodejs 5.5 && npm
  - mongodb

###### average time to pulling: 20~25 minutes

#####note
```this container uses the latest version of nodejs at this time (5.5) and for that reason, 
it must be compiled, and this take some time, almost 20 minutes.
if you will not use nodejs, maybe its a good idea change the Dockerfile to remove it,
and the average time probably will fall to 10 minutes or less```
