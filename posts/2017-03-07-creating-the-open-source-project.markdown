---
title: Creating the open-source project
author: Paul
lang: en
---

The development of Gadael is near a first public version, for this i have prepared myself to use tools to produce packages for centOs and Debian. Gadael is an open-source leave management system built on nodejs, so, the host system will be required to have mongoDB, nodejs and a http server.

The first tests on debian are proving good.

## packages creation with fpm

[fpm](https://github.com/jordansissel/fpm) is a package manager who can create simpes packages for multiples plateformes. I will use it to create the debian package (.deb) and the centOs/redhat package (.rpm).

Here is a simple command to create the nodejs application package but with a configuration file in /etc/gadael/config.json. In the repository, i created a dist/ folder with the config.json sample file. Then the fpm command set position of the files:

```bash
fpm -s dir -t deb -p ../ -n gadael --config-files /etc/gadael/config.json \
-v "0.0.1" \
./=/var/lib/gadael \
dist/config.json=/etc/gadael/
```

* `-p ../` is the folder where the package will be saved
* `-v` is the package version, this will match a git tag

Then come the file path pattern matching magic:

`./=/var/lib/gadael`: The root folder of the repository will be copied in /var/lib/gadael.

`dist/config.json=/etc/gadael/`: the file config.json will be copied in /etc/gadael/.

The remaining missing parameters are to set the dependencies, for this, i used the `-d` parameter.
The most interesting part of this software is that it is easy to create packages in other format using almost the same command.

Here is the full example with .dev and .rpm:

```bash
# Build debian package

fpm -s dir -t deb -p ../ -n gadael \
    --config-files /etc/gadael/config.json \
    -v $1 \
    -d "mongodb > 2.4.14" \
    -d "nodejs > 4.4.0" \
    ./=/var/lib/gadael dist/config.json=/etc/gadael/

# Build rpm package

fpm -s dir -t rpm -p ../ -n gadael \
    --config-files /etc/gadael/config.json \
    -v $1 \
    -d "mongodb > 2.4.14" \
    -d "nodejs > 4.4.0" \
    ./=/var/lib/gadael dist/config.json=/etc/gadael/

```

This file [build.sh is here](https://github.com/gadael/gadael/blob/master/dist/build.sh).


## Website with hexo

An open-source software need a website, gadael.org will be a domain dedicated to the open-source version, for now, this is a single page.

With [hexo](https://hexo.io/), i have built 2 sites, the SaaS version hosted on [gadael.com](https://www.gadael.com/) and the open-source application website on [gadael.org](http://www.gadael.org/).
