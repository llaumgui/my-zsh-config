#
# This file is part of My Zsh Config
#
# Copyright (c) 2014-2015 Guillaume Kulakowski <guillaume@kulakowski.fr>
# Depend of Oh My Zsh (https://github.com/robbyrussell/oh-my-zsh)
#
# Distributed under the GNU GPL v2. For full terms see the file LICENSE.
#

#
# DNF for RHEL.
#
dnf() {
    if [[ $1 == "update" ]]; then
        echo "update argument is droped with DNF.\nPlease use \"dnf upgrade\"."
        exit 0
    fi

    command yum "$@"
}
