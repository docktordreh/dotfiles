#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export PS1="\[$(tput bold)\]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;2m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;2m\]: \[$(tput sgr0)\]\[\033[38;5;124m\]\w\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;124m\]\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"
