#!/bin/bash
docker load < /tmp/notejam.tar
docker run -d -p --name notejam_container 80:80 notejam:latest
sleep 3
docker exec -t notejam_container bash -c "cd /var/www/html/;php artisan migrate --env=local"
