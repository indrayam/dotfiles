#!/bin/bash
# For MacOSX machines
# DOTFILES_HOME=$HOME/.macosx

# For Linux machines
DOTFILES_HOME=$HOME/.linux

# Git related setup
rm -f $HOME/.gitconfig
ln -s $DOTFILES_HOME/git/gitconfig.basic .gitconfig
rm -f $HOME/.gitignore_global
ln -s $DOTFILES_HOME/git/gitignore_global .gitignore_global

# Vim
rm -f $HOME/.vim
ln -s $DOTFILES_HOME/vim .vim
rm -f $HOME/.vimrc
ln -s $DOTFILES_HOME/vim/vimrc .vimrc

# Tmux
rm -f $HOME/.tmux.conf
ln -s $DOTFILES_HOME/tmux/tmux.conf .tmux.conf

# Zsh
rm -f $HOME/.zshrc
ln -s $DOTFILES_HOME/zsh/zshrc .zshrc



