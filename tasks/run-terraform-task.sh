#!/bin/bash

set -eu

# Install deps
pip3 install awslogs
rm -f /usr/local/bin/terraform

curl -o terraform.zip $(echo "https://releases.hashicorp.com/terraform/$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')/terraform_$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')_linux_amd64.zip")

# Unzip and install
unzip terraform.zip
mv terraform /usr/local/bin/terraform
terraform -v 

apt-get -y update
apt-get install -y docker

# Deploy
cd git-resource
./deploy.sh $APP

# Watch the logs until it is ok
until awslogs get datacube-dev/apps/$APP ALL --start='2m ago' --timestamp | tee /dev/tty | grep -m 1 "$STRING"; do sleep 1; done