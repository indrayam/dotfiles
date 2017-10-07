#!/bin/bash

# Dotfiles Home 
DOTFILES_HOME=$HOME/.dotfiles

# Git related setup
rm -f $HOME/.gitconfig
ln -s $DOTFILES_HOME/git/gitconfig.basic $HOME/.gitconfig
rm -f $HOME/.gitignore_global
ln -s $DOTFILES_HOME/git/gitignore_global $HOME/.gitignore_global

# Vim
rm -f $HOME/.vim
ln -s $DOTFILES_HOME/vim $HOME/.vim
rm -f $HOME/.vimrc
ln -s $DOTFILES_HOME/vim/vimrc $HOME/.vimrc

# Tmux
rm -f $HOME/.tmux.conf
ln -s $DOTFILES_HOME/tmux/tmux.conf $HOME/.tmux.conf

# Zsh
rm -f $HOME/.zshrc
ln -s $DOTFILES_HOME/zsh/zshrc.linux $HOME/.zshrc



