eval $(thefuck --alias)

autoload -Uz compinit

typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)

if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

zstyle ':completion:*' menu select

zstyle ':completion:*' group-name ''

zstyle ':completion:::::' completer _expand _complete _ignored _approximate

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
  '+l:|?=** r:|?=**'

bindkey -v
# makes the switch between modes quicker
export KEYTIMEOUT=1
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

zle -N zle-keymap-select
zle-line-init() {
    # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    # zle -K viins
    echo -ne "\e[5 q"
}

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
zle -N zle-line-init
# beam cursor on startup
echo -ne '\e[5 q'
# beam cursor for new prompt
preexec() { echo -ne '\e[5 q' ;}

setopt auto_cd

setopt auto_list

setopt auto_menu

setopt always_to_end

setopt hist_ignore_all_dups

setopt hist_reduce_blanks

setopt inc_append_history

setopt share_history

setopt interactive_comments

setopt AUTO_PUSHD

setopt PUSHD_IGNORE_DUPS

setopt PUSHD_SILENT

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

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char

source "$ZDOTDIR/.zsh_aliases"

what(){vimb "searx.neocities.org?q=$1"}

[ -z "$TMUX" ] && eval $(ssh-agent -s) && ssh-add ~/.ssh.id_ed25519

case $- in *i* )
    [ -z "$TMUX" ] && command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && exec tmux new-session -A -s main ;;
esac

source <(antibody init)

antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-completions
antibody bundle marzocchi/zsh-notify
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure

PURE_PROMPT_SYMBOL="λ"
zstyle ':prompt:pure:prompt:error' color red
zstyle ':prompt:pure:prompt:success' color green
autoload -U promptinit
promptinit
prompt pure

antibody bundle zdharma/fast-syntax-highlighting
