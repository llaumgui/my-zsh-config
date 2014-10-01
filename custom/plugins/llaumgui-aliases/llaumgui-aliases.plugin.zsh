#
# This file is part of My Zsh Config
#
# Copyright (c) 2014 Guillaume Kulakowski <guillaume@kulakowski.fr>
# Depend of Oh My Zsh (https://github.com/robbyrussell/oh-my-zsh)
#
# Distributed under the GNU GPL v2. For full terms see the file LICENSE.
#

#
# Personal aliases.
#

## Classics aliases
alias vi='vim'

## Conditionnal aliases
[ -f /usr/local/bin/service_web ] && alias service_web='sudo /usr/local/bin/service_web'
[ -d /home/builder ] && alias builder='sudo /usr/local/bin/builder'
[ -d /srv/web/public_html/ ] && hash -d www=/srv/web/public_html/
