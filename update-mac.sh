#!/bin/bash
cd $HOME
# MacOSX Updates
echo "# Starting MacOSX Updates..."
sleep 1
brew update
brew upgrade
# Python Updates
echo "# Starting Python module Updates..."
pip3 freeze --local | grep -v ^-e | cut -d = -f 1  | sudo xargs pip3 install -U
# Ruby Gem Update
echo "# Starting Ruby Gems Updates..."
sudo gem update
# NodeJS Update
echo "# Starting Node Module Updates (Global)..."
sudo npm -g --unsafe-perm update

# AWS ECS CLI Update
echo "# Starting ECS CLI Updates..."
sudo curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-darwin-amd64-latest
curl -s https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-darwin-amd64-latest.md5 && md5 -q /usr/local/bin/ecs-cli
sudo chmod 755 /usr/local/bin/ecs-cli
cd /usr/local/bin
sudo rm ./ecs
sudo ln -s ./ecs-cli ./ecs
# GCloud Update
echo "# Starting Google Cloud gcloud Updates..."
sudo gcloud components update
echo
echo "#########################"
echo "# Printing Versions..."
echo
# AWS CLI Versions
echo "# aws version..."
aws --version
echo "# aws ecs-cli version..."
ecs --version
# Google Cloud Versions
echo "# gcloud version..."
sudo gcloud --version
# Azure Version
echo "# az version..."
az --version
# Docker Version
echo "# docker version..."
docker version
# Go Version
echo "# go version..."
go version
# Python Version
echo "# python3 version..."
python3 --version
echo "# pip3 version..."
pip3 --version
# Ruby Version
echo "# ruby version..."
ruby --version
echo "# gem version..."
gem --version
# Node Version
echo "# node version..."
node --version
echo "# npm version..."
npm --version
# Java Version
echo "# java version..."
java -version
echo "# maven/mvn version..."
mvn --version
