#
# This file is part of My Zsh Config
#
# Copyright (c) 2014-2026 Guillaume Kulakowski <guillaume@kulakowski.fr>
#
# Distributed under the GNU GPL v2. For full terms see the file LICENSE.
#

# Aliases
if command -v colordiff >/dev/null 2>&1; then
    alias diff='colordiff'
else
  echo '[zsh] colordiff not found, please install it from https://www.colordiff.org/'
fi
