[ -d "$HOME/.config/proxychains" ] && export PROXYCHAINS_CONF_FILE="$HOME/.config/proxychains/proxychains.conf"

[ -d "$HOME/Android/Sdk" ]  && export ANDROID_HOME="$HOME/Android/Sdk"

[ -z "$ANDROID_HOME" ]      && [ -d "$ANDROID_HOME/platform-tools" ] && PATH="$ANDROID_HOME/platform-tools"
[ -z "$ANDROID_HOME" ]      && [ -d "$ANDROID_HOME/tools" ]          && PATH="$ANDROID_HOME/tools"

[ -d "$HOME/go/bin" ]       && PATH="$HOME/go/bin:$PATH"

[ -d "$HOME/.emacs.d/bin" ] && PATH="$HOME/.emacs.d/bin:$PATH"

[ -d "$HOME/.local/bin" ]   && PATH="$HOME/.local/bin:$PATH"

[ -d "$HOME/.cabal/bin" ]   && PATH="$HOME/.cabal/bin:$PATH"

[ -d "$HOME/.cargo/bin" ]   && PATH="$HOME/.cargo/bin:$PATH"

export PATH

export EDITOR='emacs -nw'
export VISUAL='emacs -nw'

export XDG_DATA_HOME="$HOME/.local/share"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
