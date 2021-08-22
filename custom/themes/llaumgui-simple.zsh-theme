#
# This file is part of My Zsh Config
#
# Copyright (c) 2014-2021 Guillaume Kulakowski <guillaume@kulakowski.fr>
# Depend of Oh My Zsh (https://github.com/robbyrussell/oh-my-zsh)
#
# Distributed under the GNU GPL v2. For full terms see the file LICENSE.
#

# You can override ZSH_HOST_COLOR in /etc/zshenv
if [[ -z "$ZSH_HOST_COLOR" ]]; then
    ZSH_HOST_COLOR=blue
fi

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
