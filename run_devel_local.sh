#!/bin/bash
# Run notejam in dockerized local mode
docker run -d -p 80:80 -v /home/developer/notejam/laravel/notejam:/var/www/html notejam:latest

