#
# This file is part of My Zsh Config
#
# Copyright (c) 2014-2025 Guillaume Kulakowski <guillaume@kulakowski.fr>
# Depend of Oh My Zsh (https://github.com/robbyrussell/oh-my-zsh)
#
# Distributed under the GNU GPL v2. For full terms see the file LICENSE.
#

# You can override ZSH_HOST_COLOR in /etc/zshenv
if [[ -z "$ZSH_HOST_COLOR" ]]; then
    ZSH_HOST_COLOR=blue
fi

# Git info
ZSH_THEME_GIT_COLOR=$fg[yellow]
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}[%{${ZSH_THEME_GIT_COLOR}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✘%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[yellow]%} ✚%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✹%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[yellow]%} ✖%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[yellow]%} ➜%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%} ✭%{$reset_color%}]"

# For root and user
if [ ${UID} = "0" ]; then
	ZSH_THEME_USERNAME="%{$fg_bold[red]%}%n%{$reset_color%}"
    ZSH_THEME_PATHCOLOR=red
else
	ZSH_THEME_USERNAME="%n"
    ZSH_THEME_PATHCOLOR=ZSH_HOST_COLOR
fi

# Prompts
PROMPT="$ZSH_THEME_USERNAME@%{$fg[$ZSH_HOST_COLOR]%}%m%{$reset_color%} %~%{$fg[$ZSH_THEME_PATHCOLOR]%}>%{$reset_color%} "
RPROMPT='$(git_prompt_info)'
