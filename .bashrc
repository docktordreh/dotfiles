#************************************************
#		shelloptimierungen
#************************************************
shopt -s extglob
# kuhglocke ausgeschalten
xset -b

#************************************************
#		motd
#************************************************
# TODO: eigene motd (auch für ssh conn)
neofetch

#************************************************
#		einlesen der alias'e
#************************************************
source ~/.bash_aliases
source ~/.bash_projekte

#************************************************
#		einlesen der funktionen
#************************************************
source ~/.bash_funktionen
