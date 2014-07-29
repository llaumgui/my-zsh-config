################################################################################
# My Zsh configuration                                                         #
# by Kulakowski Guillaume <guillaume.kulakowski@fedoraproject.org>             #
#                                                                              #
# Version: 2014/07/28                                                          #
#                                                                              #
# Depend:                                                                      #
#   - Oh My Zsh                                                                #
################################################################################

# Host color
HOST_COLOR=blue

# Path to your oh-my-zsh installation.
export ZSH=/opt/robbyrussell/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="llaumgui"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=/opt/llaumgui/oh-my-zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(bower colored-man colorize common-aliases composer cp git git-extras history history-substring-search node npm phing screen sudo symfony2 systemadmin systemd vagrant vim-interaction yum z)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



################################################################## Windows title
case ${TERM} in
    xterm*|screen|cygwin)
        precmd () {echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"}
        ;;
    *)
        ;;
esac



######################################################################## History
HISTFILE=~/.zsh/history

# If a new command line being added to the history list duplicates an older one,
# the older command is removed from the list (even if it is not the previous
# event). 
setopt hist_ignore_all_dups

# When searching for history entries in the line editor, do not display
# duplicates of a line previously found, even if the duplicates are not
# contiguous. 
setopt hist_find_no_dups



######################################################################## Options
# Enable correction
setopt correctall

# Do not query the user before executing rm * or rm path/*. 
unsetopt rm_star_silent # Ask confirmation for 'rm *'

## Push
setopt pushd_silent
setopt pushd_to_home

## No beep
unsetopt beep
unsetopt hist_beep
unsetopt list_beep



##################################################################### Completion
## Use cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

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
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always



########################################################################## Alias
source $HOME/.zsh/zshrc_alias
