#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PYTHONIOENCODING=UTF-8

#eval `keychain --eval $(cat $HOME/.ssh/sshkeys)` 
if [ -n "$DESKTOP_SESSION" ];then
    eval "$(gnome-keyring-daemon --start)"
    export SSH_AUTH_SOCK
fi
