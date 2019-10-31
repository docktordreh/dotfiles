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
neofetch

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
