
[ -n "$DESKTOP_SESSION" ] && eval "$(gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)" && export SSH_AUTH_SOCK
