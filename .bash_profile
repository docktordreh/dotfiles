#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export PS1="\[$(tput bold)\]\[\033[38;5;2m\]\u@\h\[\033[38;5;2m\]: \[\033[38;5;124m\]\w\[\033[38;5;124m\] $ \[$(tput sgr0)\]"
