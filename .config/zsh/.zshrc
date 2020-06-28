eval $(thefuck --alias)
if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi

bindkey -v
export KEYTIMEOUT=1


# Enable autocompletions
autoload -Uz compinit

typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)

if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi


zmodload -i zsh/complist
# Options
# cd by typing directory name if it's not a command
setopt auto_cd 
# automatically list choices on ambiguous completion
setopt auto_list
# menu completion 
setopt auto_menu
# move cursor to end if match
setopt always_to_end 
# remove old duplicates from hist
setopt hist_ignore_all_dups 
# remove superfluous blanks from hist
setopt hist_reduce_blanks
# hist gets saved when entered
setopt inc_append_history
# shares hist between instances
setopt share_history
# autocorrect commands
setopt correct_all 
# allow comments in interactive shells
setopt interactive_comments 

# Improve autocompletion style
# sel completion with arrow
zstyle ':completion:*' menu select 
# group results by cat
zstyle ':completion:*' group-name ''
# enable approximate matches
zstyle ':completion:::::' completer _expand _complete _ignored _approximate
# Highlight the current autocomplete option
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# Allow for autocomplete to be case insensitive
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
  '+l:|?=** r:|?=**'

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
    # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    # zle -K viins 
    echo -ne "\e[5 q"
}
zle -N zle-line-init
# beam cursor on startup
echo -ne '\e[5 q'
# beam cursor for new prompt
preexec() { echo -ne '\e[5 q' ;} 

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
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
alias sudo='doas'

case $- in *i* )
    [ -z "$TMUX" ] && ~/tmux-setup.sh ;;
esac
# Load antibody plugin manager
source <(antibody init)
# Plugins
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
# antibody bundle denysdovhan/spaceship-prompt
# SPACESHIP_PROMPT_ORDER=(
#   time          # Time stamps section
#   user          # Username section
#   dir           # Current directory section
#   host          # Hostname section
#   git           # Git section (git_branch + git_status)
#   package       # Package version
#   node          # Node.js section
#   ruby          # Ruby section
#   elixir        # Elixir section
#   swift         # Swift section
#   golang        # Go section
#   haskell       # Haskell Stack section
#   docker        # Docker section
#   venv          # virtualenv section
#   conda         # conda virtualenv section
#   pyenv         # Pyenv section
#   kubectl       # Kubectl context section
#   exec_time     # Execution time
#   line_sep      # Line break
#   battery       # Battery level and status
#   vi_mode       # Vi-mode indicator
#   jobs          # Background jobs indicator
#   exit_code     # Exit code section
#   char          # Prompt character
# )
# # Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char


antibody bundle zdharma/fast-syntax-highlighting
