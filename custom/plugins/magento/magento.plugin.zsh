#
# This file is part of My Zsh Config
#
# Copyright (c) 2014 Guillaume Kulakowski <guillaume@kulakowski.fr>
# Depend of Oh My Zsh (https://github.com/robbyrussell/oh-my-zsh)
#
# Distributed under the GNU GPL v2. For full terms see the file LICENSE.
#

#
# Magento aliases & completion.
#

## shell/cache.php
## Using https://github.com/ticean/magento-shell-tools/blob/master/shell/cache.php
_mgtcache_get_command_list () {
	php -f shell/cache.php -- help | sed "1,/info/d" | awk '/^  [a-z|\-\-]+/ { print $1 }'
}

_mgtcache () {
  if [ -f shell/cache.php ]; then
    compadd `_mgtcache_get_command_list`
  fi
}

compdef _mgtcache 'shell/cache.php'
compdef _mgtcache mgtcache
alias mgtcl='php shell/cache.php -- destroy'
alias mgtcache='php shell/cache.php -- '


## shell/compiler.php
_mgtcompiler_get_command_list () {
	php -f shell/compiler.php -- help | sed "0,/Usage/d" | awk '/^  [a-z|\-\-]+/ { print $1 }'
}

_mgtcompiler () {
  if [ -f shell/compiler.php ]; then
    compadd `_mgtcompiler_get_command_list`
  fi
}

compdef _mgtcompiler 'shell/compiler.php'
compdef _mgtcompiler mgtcompile
alias mgtcompiler='php shell/compiler.php -- '


## shell/indexer.php
_mgtindexer_get_command_list () {
	php -f shell/indexer.php -- help | sed "0,/Usage/d" | awk '/^  [a-z|\-\-]+/ { print $1 }'
}

_mgtindexer () {
  if [ -f shell/indexer.php ]; then
    compadd `_mgtindexer_get_command_list`
  fi
}

compdef _mgtindexer 'shell/indexer.php'
compdef _mgtindexer mgtindexer
alias mgtindexer='php shell/indexer.php -- '


## shell/log.php
_mgtlog_get_command_list () {
	php -f shell/log.php -- help | sed "2,/ /d" | awk '/^  [a-z|\-\-]+/ { print $1 }'
}

_mgtlog () {
  if [ -f shell/log.php ]; then
    compadd `_mgtlog_get_command_list`
  fi
}

compdef _mgtlog 'shell/log.php'
compdef _mgtlog mgtlog
alias mgtlog='php shell/log.php -- '
