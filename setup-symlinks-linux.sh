#!/bin/bash

# Dotfiles Home 
DOTFILES_HOME=$HOME/.dotfiles

# Git related setup
rm -f $HOME/.gitconfig
ln -s $DOTFILES_HOME/git/gitconfig.linux $HOME/.gitconfig
rm -f $HOME/.gitignore_global
ln -s $DOTFILES_HOME/git/gitignore_global $HOME/.gitignore_global

# Vim
rm -f $HOME/.vim
ln -s $DOTFILES_HOME/vim $HOME/.vim
rm -f $HOME/.vimrc
ln -s $DOTFILES_HOME/vim/vimrc $HOME/.vimrc

# Zsh
rm -f $HOME/.zshrc
ln -s $DOTFILES_HOME/zsh/zshrc.linux $HOME/.zshrc

# Starship
rm -f $HOME/.config/starship.toml
ln -s $DOTFILES_HOME/starship/starship.toml $HOME/.config/starship.toml

