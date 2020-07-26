export XDG_DATA_HOME="$HOME/.local/share"

export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

export HISTSIZE=100000

export SAVEHIST=$HISTSIZE

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
