# Manifest

.travis.yml
- Travis build instructions

appspec.yml
- AWS descriptor for running the application

before_deploy.sh
- run on travis-ci before an actual deployment happens; discovers db hostname with awscli, creates config file for the database access, saves docker image, creates application bundle

before_install.sh
- sets up application environment for travis builds

apache-config.conf  
- apache vhost configuration for Laravel front-end

Dockerfile_apache
- dockerfile for building the dockerized version

dockerup.sh
- As described in appspec.yml, brings up the application after it is deployed.

run_devel_local.sh
- Run dockerized application in local development mode

run_tests_local.sh
- Run unit test in local mode (in docker)
