if [[ -z "$HOST_COLOR" ]]; then
    HOST_COLOR=blue
fi

if [ ${UID} = "0" ]; then
	PROMPT="%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg[$HOST_COLOR]%}%m%{$reset_color%} %~%{$fg_bold[red]%}>%{$reset_color%} " 
else
	PROMPT="%n@%{$fg[$HOST_COLOR]%}%m%{$reset_color%} %~%{$fg[$HOST_COLOR]%}>%{$reset_color%} " 
fi

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[yellow]%}" 
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}" 
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}) %{$fg[red]%}✗%{$reset_color%}" 
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%})"


## Pseudo zlogin
echo "${fg[${COLOR}]}$(uptime)"
echo "Kernel: $(uname -r) ($(uname -v))${reset_color}"
echo ""
[ -f /usr/bin/fortune ] && [ -d /usr/share/games/fortune-fr ] && fortune /usr/share/games/fortune-fr/ && echo ""
