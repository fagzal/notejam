#!/bin/bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker build -f docker/Dockerfile_apache -t notejam:latest .
docker run --name notejam_container -d -p 80:80 notejam:latest
docker exec -t notejam_container bash -c "/usr/local/bin/php /var/www/html/vendor/bin/phpunit"

