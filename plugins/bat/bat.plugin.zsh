#
# This file is part of My Zsh Config
#
# Copyright (c) 2014-2026 Guillaume Kulakowski <guillaume@kulakowski.fr>
#
# Distributed under the GNU GPL v2. For full terms see the file LICENSE.
#

# Aliases
if command -v bat >/dev/null 2>&1; then
    alias cat='bat'
elif command -v batcat >/dev/null 2>&1; then
    alias cat='batcat'
else
  echo '[zsh] bat not found, please install it from https://github.com/sharkdp/bat'
fi
