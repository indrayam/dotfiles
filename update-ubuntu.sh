#!/bin/bash
cd $HOME
# Ubuntu Updates
sudo apt update
sudo apt upgrade
sudo apt list --upgradeable
# Python Updates
sudo pip3 freeze --local | grep -v ^-e | cut -d = -f 1  | xargs sudo pip3 install -U
# Ruby Gem Update
sudo gem update
# NodeJS Update
sudo npm -g --unsafe-perm
cd $HOME/workspace/node-apps/helloapp
npm update
cd $HOME
# AWS ECS CLI Update
sudo curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
echo "$(curl -s https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest.md5) /usr/local/bin/ecs-cli" | md5sum -c -
sudo chmod 755 /usr/local/bin/ecs-cli
cd /usr/local/bin
sudo ln -s ./ecs-cli ./ecs
# GCloud Update
gcloud components update
# AWS CLI Versions
aws --version
ecs --version
# Google Cloud Versions
gcloud --version
# Azure Version
az --version
# Docker Version
docker version
# Go Version
go version
# Python Version
python3 --version
pip3 --version
# Ruby Version
ruby --version
gem --version
# Node Version
node --version
npm --version
# Java Version
java --version
mvn --version
