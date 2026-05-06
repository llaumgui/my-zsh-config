#
# This file is part of My Zsh Config
#
# Copyright (c) 2014-2026 Guillaume Kulakowski <guillaume@kulakowski.fr>
#
# Distributed under the GNU GPL v2. For full terms see the file LICENSE.
#

# Aliases
#alias antidote load="antidote load ${ZDOTDIR:-$HOME}/.zsh/plugins.txt"


# Provides:
#   antidote_update_if_needed
#
# Configuration:
#   ZSH_ANTIDOTE_UPDATE=15
_antidote_update_if_needed() {
    emulate -L zsh

    local update_days="${ZSH_ANTIDOTE_UPDATE:-15}"

    if [[ "$update_days" != <-> ]]; then
        update_days=15
    fi

    local threshold_seconds=$(( update_days * 86400 ))
    local cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/antidote"
    local lastupdate_file="${cache_dir}/lastupdate"
    local lock_dir="${cache_dir}/update.lock"

    local now
    if zmodload zsh/datetime 2>/dev/null; then
        now="$EPOCHSECONDS"
    else
        now="$(command date +%s 2>/dev/null)" || {
            print -u2 -r -- "antidote_update_if_needed: unable to get current timestamp"
            return 1
        }
    fi

    if [[ -r "$lastupdate_file" ]]; then
        local lastupdate
        lastupdate="$(<"$lastupdate_file")"

        if [[ "$lastupdate" == <-> ]] && (( lastupdate <= now )); then
            local age_seconds=$(( now - lastupdate ))

            if (( age_seconds < threshold_seconds )); then
                return 0
            fi
        fi
    fi

    if ! command mkdir -- "$lock_dir" 2>/dev/null; then
        print -r -- "antidote: update already running"
        return 0
    fi

    local -a update_cmd

    # Only update himself if root
    if (( EUID == 0 )); then
        update_cmd=(antidote update)
    else
        update_cmd=(antidote update -b)
    fi

    if (( ! $+functions[antidote] && ! $+commands[antidote] )); then
        command rmdir -- "$lock_dir" 2>/dev/null
        print -u2 -r -- "antidote_update_if_needed: antidote command or function not found"
        return 127
    fi

    print -r -- "antidote: running ${update_cmd[*]}"

    local rc=0

    if "${update_cmd[@]}"; then
        local updated_at

        if zmodload zsh/datetime 2>/dev/null; then
            updated_at="$EPOCHSECONDS"
        else
            updated_at="$(command date +%s 2>/dev/null)" || updated_at="$now"
        fi

        print -r -- "$updated_at" >| "$lastupdate_file" || rc=$?

        if (( rc == 0 )); then
            print -r -- "antidote: last update stored in $lastupdate_file"
        else
            print -u2 -r -- "antidote_update_if_needed: unable to write $lastupdate_file"
        fi
    else
        rc=$?
        print -u2 -r -- "antidote_update_if_needed: update failed with exit code $rc"
    fi

    command rmdir -- "$lock_dir" 2>/dev/null

    return "$rc"
}

# Call the function
_antidote_update_if_needed
