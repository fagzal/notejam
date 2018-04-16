#!/usr/bin/env bash

#mkdir -p ~/.aws
#
#cat > ~/.aws/credentials << EOL
#[default]
#aws_access_key_id = ${AWS_ACCESS_KEY_ID}
#aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}
#EOL

aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
aws configure set ws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}
aws configure set default.region us-east-2
