#!/bin/bash
# This script is run before an AWS deployment is done.

# Get, install, configure AWS
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
./awscli-bundle/install -b ~/bin/aws
export PATH=~/bin:$PATH
aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
aws configure set ws_secret_access_key ${AWS_SECRET_ACCESS_KEY}
aws configure set default.region ${AWS_DEFAULT_ZONE}
RDSHOST=$(aws rds describe-db-instances --db-instance-identifier aurorac --query 'DBInstances[0].Endpoint.Address')
cat > laravel/notejam/app/config/local/database.php << EOL
<?php

return array(
        'driver'    => 'mysql',
        'host'      => ${RDSHOST},
        'database'  => 'notejam',
        'username'  => 'notejamuser',
        'password'  => 'xxxx',
        'charset'   => 'utf8',
        'collation' => 'utf8_unicode_ci',
        'prefix'    => '',
);
EOL

# rebuild image as files has changed
docker build -f docker/Dockerfile_apache -t notejam:latest .
mkdir build
docker save notejam:latest > build/notejam.tar
zip -r build/bundle.zip build/notejam.tar appspec.yml dockerup.sh 

#echo ${RDSHOST} > laravel/notejam/app/config/local/database.php

