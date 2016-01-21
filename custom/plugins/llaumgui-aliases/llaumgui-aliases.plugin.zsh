#
# This file is part of My Zsh Config
#
# Copyright (c) 2014-2015 Guillaume Kulakowski <guillaume@kulakowski.fr>
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
[ -d /home/builder ] && alias builder='sudo /usr/local/bin/builder'
[ -d /srv/web/public_html/ ] && hash -d www=/srv/web/public_html/

## Misc
alias mksrpm='rpmbuild -bs --define "_source_filedigest_algorithm 0" --define "_binary_filedigest_algorithm 0" '
