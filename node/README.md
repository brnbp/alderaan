[![](https://images.microbadger.com/badges/image/brnbp/node.svg)](https://microbadger.com/images/brnbp/node "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/brnbp/node.svg)](http://microbadger.com/images/brnbp/node "Get your own version badge on microbadger.com")

### Docker container for development of nodejs projects
--------

> this Dockerfile contains:
  - Debian Jessie
  - Git
  - NodeJS 5.6 && npm
  - MongoDB

###### average time to pulling: 10 minutes

----


###### you can simple clone this repo and run

``` $ docker build -t foo/bar:0.1 . ```

``` $ docker run -v /path/host/host-project:/var/www -p 8080:3000 -i -t foo/bar:0.1 ```

##### or you can just use it from docker registry

``` $ docker run -v /path/host/host-project:/var/www -p 8080:3000 -it brunopereira2546/node:latest ```


--------

###### You can now visit 127.0.0.1:8080 to view your application running!

