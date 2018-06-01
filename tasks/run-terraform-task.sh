#!/bin/bash

set -eu

# Install deps
pip3 install awslogs

# Deploy
cd git-resource
./deploy.sh $APP

# Watch the logs until it is ok
until awslogs get datacube-dev/apps/$APP ALL --start='2m ago' --timestamp | tee /dev/tty | grep -m 1 "$STRING"; do sleep 1; done