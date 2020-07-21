#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrandr --auto
# load additional configs

if [ -d "$XINIT_D" ]; then
  for f in "$XINIT_D"/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
eval "$(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)"
export "$(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)"
. "$HOME/.xprofile"
sxhkd &
case $session in
    i3|i3wm           ) exec i3;;
    kde               ) exec startplasma-x11;;
    xfce|xfce4        ) exec startxfce4;;
    xmonad            ) exec xmonad;;
    # No known session, try to run it as command
    *                 ) exec $1;;
esac
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
