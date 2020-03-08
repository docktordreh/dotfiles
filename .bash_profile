#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export PS1="\[$(tput bold)\]\[\033[38;5;2m\]\u@\h\[\033[38;5;2m\]: \[\033[38;5;124m\]\w\[\033[38;5;124m\] $ \[$(tput sgr0)\]"
export PYTHONIOENCODING=UTF-8
#eval `keychain --eval $(cat $HOME/.ssh/sshkeys)` 
if [ -n "$DESKTOP_SESSION" ];then
    eval "$(gnome-keyring-daemon --start)"
    export SSH_AUTH_SOCK
fi
