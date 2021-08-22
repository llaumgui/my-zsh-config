#
# This file is part of My Zsh Config
#
# Copyright (c) 2014-2021 Guillaume Kulakowski <guillaume@kulakowski.fr>
# Depend of Oh My Zsh (https://github.com/robbyrussell/oh-my-zsh)
#
# Distributed under the GNU GPL v2. For full terms see the file LICENSE.
#


function upgrade_oh_my_zsh() {
    # Oh My Zsh upgrade
    /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh

    # My Zsh Config upgrade
    echo "\n\n"
    printf '\033[0;35m%s\033[0m\n' "Upgrading My Zsh Config"
    cd "$ZSH_MY_ZSH_CONFIG"
    if git pull --rebase --stat origin main
    then
        printf '\033[0;35m%s\033[0m\n' 'Hooray! My Zsh Config has been updated and/or is at the current version.'
    else
        printf '\033[0;31m%s\033[0m\n' 'There was an error updating. Try again later?'
    fi
}
