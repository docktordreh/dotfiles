#! /usr/bin/env bash
#************************************************
#		shelloptimierungen
#************************************************
shopt -s extglob
# kuhglocke ausgeschalten
xset -b
cd "$HOME" || return
#************************************************
#		motd
#************************************************
# TODO: eigene motd (auch für ssh conn)

#************************************************
#		einlesen der alias'e
#************************************************
source "$HOME"/.bash_aliases
source "$HOME"/.bash_projekte

#************************************************
#		einlesen der funktionen
#************************************************
source ~/.bash_funktionen

eval $(thefuck --alias)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
