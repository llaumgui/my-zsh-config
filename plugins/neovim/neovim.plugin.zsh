#
# This file is part of My Zsh Config
#
# Copyright (c) 2014-2026 Guillaume Kulakowski <guillaume@kulakowski.fr>
#
# Distributed under the GNU GPL v2. For full terms see the file LICENSE.
#

if command -v nvim >/dev/null 2>&1; then
    # neovim aliases.
    alias vi='nvim'
    alias vim='nvim'

    # nvim by default.
    export EDITOR='nvim'
else
  echo '[zsh] neovim not found, please install it from https://neovim.io/'
fi
