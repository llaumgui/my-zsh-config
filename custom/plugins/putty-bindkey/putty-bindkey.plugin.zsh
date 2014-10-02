#
# This file is part of My Zsh Config
#
# Copyright (c) 2014 Guillaume Kulakowski <guillaume@kulakowski.fr>
# Depend of Oh My Zsh (https://github.com/robbyrussell/oh-my-zsh)
#
# Distributed under the GNU GPL v2. For full terms see the file LICENSE.
#

#
# Keys binding.
#
case $TERM in
    screen*|xterm*|putty*)
        # Home/End
        bindkey '\e[1~' beginning-of-line
        bindkey '\e[4~' end-of-line

        # Keypad
        # 0 . Enter
        bindkey -s "^[Op" "0"
        bindkey -s "^[On" "."
        bindkey -s "^[OM" "^M"
        # 1 2 3
        bindkey -s "^[Oq" "1"
        bindkey -s "^[Or" "2"
        bindkey -s "^[Os" "3"
        # 4 5 6
        bindkey -s "^[Ot" "4"
        bindkey -s "^[Ou" "5"
        bindkey -s "^[Ov" "6"
        # 7 8 9
        bindkey -s "^[Ow" "7"
        bindkey -s "^[Ox" "8"
        bindkey -s "^[Oy" "9"
        # + -  * /
        bindkey -s "^[Ok" "+"
        bindkey -s "^[Om" "-"
        bindkey -s "^[Oj" "*"
        bindkey -s "^[Oo" "/"
    ;;
esac
