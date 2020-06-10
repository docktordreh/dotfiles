if ! pgrep -u "$USER" ssh-agent > /dev/null; then
	    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
	    { eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")" } &>/dev/null
fi

export ZSH="$HOME/.oh-my-zsh"

plugins=(git
	adb
	ansible
	tmux
	)
ZSH_THEME="typewritten"
source $ZSH/oh-my-zsh.sh


export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$HOME/.local/bin:$HOME/git-progs/voidrice/.local/bin:$HOME/git-progs/voidrice/.local/bin/statusbar:$HOME/.emacs.d/bin:$HOME/go/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

setopt autocd
bindkey -v
export KEYTIMEOUT=1


autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)


# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

bindkey -s '^b' 'bc -l\n'

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
alias doas='sudo'

eval $(thefuck --alias)
case $- in *i* )
	[ -z "$TMUX" ] && ~/tmux-setup.sh ;;
esac
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
source "$ZSH/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
