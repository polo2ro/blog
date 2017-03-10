#!/bin/bash
nodemon -C -w ./ -e markdown,hs,html --exec "stack exec site build"
