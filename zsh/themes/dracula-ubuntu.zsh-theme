# Dracula Theme v1.2.5
#
# https://github.com/dracula/dracula-theme
#
# Copyright 2016, All rights reserved
#
# Code licensed under the MIT license
# http://zenorocha.mit-license.org
#
# @author Zeno Rocha <hi@zenorocha.com>

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
local user=`whoami`
NEWLINE=$'\n'

PROMPT='${ret_status} %{$fg[magenta]%}${user}%{$reset_color%} at %{$fg[yellow]%M%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)% %{$reset_color%} '
PROMPT='$(kube_ps1) '${NEWLINE}$PROMPT

ZSH_THEME_GIT_PROMPT_CLEAN=") %{$fg_bold[green]%}✔ "
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg_bold[yellow]%}✗ "
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
