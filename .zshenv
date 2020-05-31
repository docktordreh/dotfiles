[ -n "$DESKTOP_SESSION" ] && eval $(gnome-keyring-daemon --start) && export SSH_AUTH_SOCK
export EDITOR='emacs -nw'
export TERM='st-256color'
