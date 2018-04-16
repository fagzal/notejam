#!/usr/bin/env bash

cd laravel/notejam
composer install
cd ../../
docker build -f docker/Dockerfile_apache -t notejam:latest .
docker run --name notejam_container -d -p 80:80 notejam:latest
sleep 1
docker ps -a
sleep 1

#echo ${RDSHOST} > laravel/notejam/app/config/local/database.php

