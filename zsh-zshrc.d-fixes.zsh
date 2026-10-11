export SHELL=$(which zsh)

# fix tmux key bindings for beginning and end of line
bindkey -e
bindkey $'\e[1~' beginning-of-line
bindkey $'\e[4~' end-of-line

autoload -Uz compinit && compinit
if command -v crictl >/dev/null 2>&1; then
    eval "$(register-python-argcomplete --shell zsh coenter)"
fi
