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


# set ccache variables
export PATH="/usr/local/libexec/ccache:""$PATH"
export CCACHE_PATH="/usr/bin:/usr/local/bin"
export CCACHE_DIR="/var/tmp/ccache"
export CCACHE_LOGFILE="/var/log/ccache.log"

# set ccache temp size to 512MB (default 1GB)
if [ -x /usr/local/bin/ccache ]; then
  /usr/local/bin/ccache -M 512Mi > /dev/null
fi
