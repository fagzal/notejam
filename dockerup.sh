#!/bin/bash
# This script is called right after codedeploy is done on a new instance on EC2.

# Load pushed docker image
docker load < /tmp/notejam.tar
# Run container as name...
docker run -d -p --name notejam_container 80:80 notejam:latest
sleep 3
# Run migrate, override env to local (since this is a console run via artisan)
docker exec -t notejam_container bash -c "cd /var/www/html/;php artisan migrate --env=local"
