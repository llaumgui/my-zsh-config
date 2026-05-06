#
# This file is part of My Zsh Config
#
# Copyright (c) 2014-2026 Guillaume Kulakowski <guillaume@kulakowski.fr>
#
# Distributed under the GNU GPL v2. For full terms see the file LICENSE.
#

if command -v fastfetch >/dev/null 2>&1 && [[ -z "$FASTFETCH_DONE" ]] && [[ $- == *i* ]]; then
    export FASTFETCH_DONE=1
    fastfetch
fi

