#!/bin/bash

set -e

pip install awscli --upgrade

aws --version

echo "$content" > index.html

aws s3 cp ./index.html s3://$BUCKET_NAME
