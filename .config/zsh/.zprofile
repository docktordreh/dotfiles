export EDITOR='emacs -nw'
export VISUAL='emacs -nw'

[ -d "$HOME/.config/proxychains" ] && export PROXYCHAINS_CONF_FILE="$HOME/.config/proxychains/proxychains.conf"

[ -n "$GOPATH" ] && [ -d "$GOPATH/bin" ]       && PATH="$GOPATH/bin:$PATH"

[ -d "$HOME/.emacs.d/bin" ] && PATH="$HOME/.emacs.d/bin:$PATH"

[ -d "$XDG_CONFIG_HOME/emacs" ] && PATH="$XDG_CONFIG_HOME/emacs/bin:$PATH"

[ -d "$XDG_CONFIG_HOME/local/bin" ]   && PATH="$XDG_CONFIG_HOME/local/bin:$PATH"

[ -n "$CARGO_HOME" ] && [ -d "$CARGO_HOME/bin" ]   && PATH="$CARGO_HOME/bin:$PATH"

export PATH