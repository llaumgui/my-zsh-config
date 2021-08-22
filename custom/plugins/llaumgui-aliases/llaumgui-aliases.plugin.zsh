#
# This file is part of My Zsh Config
#
# Copyright (c) 2014-2021-2015 Guillaume Kulakowski <guillaume@kulakowski.fr>
# Depend of Oh My Zsh (https://github.com/robbyrussell/oh-my-zsh)
#
# Distributed under the GNU GPL v2. For full terms see the file LICENSE.
#

#
# Personal aliases.
#

## Misc
alias mksrpm='rpmbuild -bs --define "_source_filedigest_algorithm 0" --define "_binary_filedigest_algorithm 0" '

# Docker
alias dcp='docker ps -a | grep Exit | cut -d " " -f 1 | xargs docker rm'
alias dip='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
