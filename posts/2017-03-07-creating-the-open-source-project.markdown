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

The remaining missing parameters are to set the dependencies.


## Website with hexo

With [hexo](https://hexo.io/), i have built 2 sites, the SaaS version hosted on [gadael.com](https://www.gadael.com/) and the open-source application website on [gadael.org](http://www.gadael.org/).
