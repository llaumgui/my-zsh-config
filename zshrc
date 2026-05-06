#
# This file is part of My Zsh Config
#
# Copyright (c) 2014-2026 Guillaume Kulakowski <guillaume@kulakowski.fr>
#
# Distributed under the GNU GPL v2. For full terms see the file LICENSE.
#

########################################################################## Paths

# Antidote libs
ZSH_ANTIDOTE='/opt/mattmc3/antidote/'

# Create ZSH folder
if [ ! -d "${ZDOTDIR:-$HOME}/.zsh" ]; then
    mkdir -p "${ZDOTDIR:-$HOME}/.zsh"
fi

# Create and use ~/.cache/zsh
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
if [ ! -d "${ZSH_CACHE_DIR}" ]; then
    mkdir -p "${ZSH_CACHE_DIR}"
fi

# Setup z
_Z_DATA="${XDG_CACHE_HOME:-$HOME/.cache}/z"

# History
HISTFILE="${ZDOTDIR:-$HOME}/.zsh/history"

# zcompletion
ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zsh/zcompdump-${ZSH_VERSION}"

# PATH
path+=("${ZDOTDIR:-$HOME}/.local/bin")
path+=("${ZDOTDIR:-$HOME}/.npm/bin")


####################################################################### Antidote

# Set the root name of the plugins files (.txt and .zsh) antidote will use.
ZSH_PLUGINS="${ZDOTDIR:-$HOME}/.zsh/plugins"

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f "${ZSH_PLUGINS}.txt" ]] || touch "${ZSH_PLUGINS}.txt"

# Lazy-load antidote from its functions directory.
fpath=("${ZSH_ANTIDOTE}/functions" $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! "${ZSH_PLUGINS}.zsh" -nt "${ZSH_PLUGINS}.txt" ]]; then
  antidote bundle <${ZSH_PLUGINS}.txt >|${ZSH_PLUGINS}.zsh
fi

# Source your static plugins file.
source "${ZSH_PLUGINS}.zsh"


####################################################################### Power10K

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh


######################################################################## History

# If a new command line being added to the history list duplicates an older one,
# the older command is removed from the list (even if it is not the previous
# event).
setopt hist_ignore_all_dups

# When searching for history entries in the line editor, do not display
# duplicates of a line previously found, even if the duplicates are not
# contiguous.
setopt hist_find_no_dups


##################################################################### Completion

## Use cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

# If this option is set completions are shown only if the completions don't have
# an unambiguous prefix or suffix that could be inserted in the command line.
unsetopt list_ambiguous

# When the last character resulting from a completion is a slash and the
# next character typed is a word delimiter, remove the slash.
setopt auto_remove_slash

## cd
zstyle ':completion:*:cd:*' ignore-parents parent pwd

## Prevent to propose a item already prpose
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes

## killall
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'


######################################################################## Options

# Enable correction
#setopt correctall

# Do not query the user before executing rm * or rm path/*.
unsetopt rm_star_silent # Ask confirmation for 'rm *'

## Push
setopt pushd_silent
setopt pushd_to_home

## No beep
unsetopt beep
unsetopt hist_beep
unsetopt list_beep

# zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^ ' autosuggest-accept

######################################################################## Aliases

## Classic
alias df='df -h'
alias more='less'
alias lla='ls -la'
