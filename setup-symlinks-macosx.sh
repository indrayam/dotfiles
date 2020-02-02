#!/bin/bash

# Dotfiles Home (for my MacBook) 
DOTFILES_HOME=$HOME/.dotfiles

# Git related setup
rm -f $HOME/.gitconfig
ln -s $DOTFILES_HOME/git/gitconfig $HOME/.gitconfig
rm -f $HOME/.gitignore_global
ln -s $DOTFILES_HOME/git/gitignore_global $HOME/.gitignore_global

# Tmux
rm -f $HOME/.tmux.conf
rm -f $HOME/.tmux.conf.local
ln -s $DOTFILES_HOME/tmux/tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES_HOME/tmux/tmux.conf.local $HOME/.tmux.conf.local

# Vim
rm -f $HOME/.vim
ln -s $DOTFILES_HOME/vim $HOME/.vim
rm -f $HOME/.vimrc
ln -s $DOTFILES_HOME/vim/vimrc $HOME/.vimrc

# Zsh
rm -f $HOME/.zshrc
ln -s $DOTFILES_HOME/zsh/zshrc $HOME/.zshrc

# Stuff
rm -f $HOME/.kube
git@github.com:indrayam/dotkube.git $HOME/.dotkube
rm -f $HOME/.hal
git@github.com:indrayam/dothal.git $HOME/.dothal
ln -s $HOME/.hal $HOME/.dothal
rm -f $HOME/.kube-ps1
ln -s /usr/local/opt/kube-ps1/share $HOME/.kube-ps1
rm -f $HOME/.p10k.zsh
ln -s $HOME/p10k/p10k.zsh $HOME/.p10k.zsh
rm -f $HOME/workspace
ln -s /Users/anasharm/Dropbox/workspace/2020 $HOME/workspace
rm -f $HOME/bin
ln -s /Users/anasharm/Dropbox/workspace/bin $HOME/bin
rm -f $HOME/rtp
ln -s $HOME/bin/rtp $HOME/rtp
rm -f $HOME/alln
ln -s $HOME/bin/alln $HOME/alln
rm -f $HOME/rcdn
ln -s $HOME/bin/rcdn $HOME/rcdn


