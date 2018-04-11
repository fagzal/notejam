#!/bin/bash
docker load < /tmp/notejam.tar
docker run -d -p 80:80 notejam:latest
