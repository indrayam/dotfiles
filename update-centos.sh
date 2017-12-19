#!/bin/bash
cd $HOME
# Update dotfile repo
echo "# Starting $HOME/.dotfiles repo update..."
sleep 1
git remote update
git pull --rebase origin master
source $HOME/.zshrc
# CentOS Updates
cd $HOME
echo "# Starting CentOS Updates..."
sleep 1
sudo yum update
sudo yum -y upgrade

# Python Updates
echo "# Starting Python module Updates..."
sudo pip3 freeze --local | grep -v ^-e | cut -d = -f 1  | xargs sudo pip3 install -U
# Ruby Gem Update
echo "# Starting Ruby Gems Updates..."
sudo gem update
# NodeJS Update
echo "# Starting Node Module Updates (Global)..."
sudo npm -g --unsafe-perm update
cd $HOME/workspace/node-apps/helloapp
echo "# Starting Node Module Updates (Local)..."
npm update
cd $HOME
# Update npm 
sudo npm i -g npm
# AWS ECS CLI Update
echo "# Starting ECS CLI Updates..."
sudo curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
echo "$(curl -s https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest.md5) /usr/local/bin/ecs-cli" | md5sum -c -
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
mvn -version
