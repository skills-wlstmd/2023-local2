#!/bin/bash
yum update -y
yum install jq curl -y

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version

ln -s /usr/local/bin/aws /usr/bin/
ls -s /usr/local/bin/aws_completer /usr/bin/
