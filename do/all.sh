#!/bin/bash
apt -y update
apt -y upgrade
add-apt-repository -y ppa:jonathonf/vim
apt install vim zsh
curl -O https://s3.amazonaws.com/us-east-1-anand-files/misc-files/ssh.tar.gz
tar -xvzf ssh.tar.gz
mv ssh/* .ssh/
chmod 700 .ssh/
rm -rf ssh/ ssh.tar.gz
ssh -o "StrictHostKeyChecking no" -T git@github.com
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh
sed -i.tmp 's:env zsh::g' install.sh
sh install.sh
cd ~
git clone git@github.com:indrayam/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
~/.dotfiles/setup-symlinks-ubuntu.sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c 'PluginInstall' -c 'qa!'
rm ~/install.sh*
