export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
# on wayland it often has to be initialized manually
if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/1000;
    mkdir ${XDG_RUNTIME_DIR}
    chmod 700 ${XDG_RUNTIME_DIR}
fi

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.config/local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.config/local/share}/go"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.config/local/share}/gnupg"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.config/local/share}/pass"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/readline/inputrc"
export PYLINTHOME="${XDG_CACHE_HOME:-$HOME/.config/cache}/pylint"
export LESSHISTFILE=-

# python path
export LOCAL_SCRIPTS=$HOME/.local/bin
export PYTHONPATH=$HOME/.local/bin/python
export PATH=$PATH:$LOCAL_SCRIPTS:$PYTHONPATH
# cargo path
[ -f "${XDG_DATA_HOME}/cargo/env" ] && . "${XDG_DATA_HOME}/cargo/env"

# compatibility for tiling window managers in wayland and qtile
export QT_QPA_PLATFORM="wayland;xcb"
export QT_QPA_PLATFORMTHEME=qt5ct
# for tor proxy
export SOCKS_PROXY="socks5://127.0.0.1:9050"
