keychain --quiet --eval --noask --agents ssh,gpg id_rsa | source /dev/stdin

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$HOME/.local/bin:$HOME/.emacs.d/bin:$HOME/go/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/.cabal/bin

export EDITOR='emacs -nw'
export VISUAL='emacs -nw'

export XDG_DATA_HOME="$HOME/.local/share"

export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

export HISTSIZE=100000

export SAVEHIST=$HISTSIZE

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
