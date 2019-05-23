#************************************************
#               editor-kürzel
#************************************************

# v = vim
alias v='vim'
# konfigurationsdateien
alias brc='vim ~/.bashrc'
alias i3c='vim ~/.config/i3/config'
alias ba='vim ~/.bash_aliases'
alias bp='vim ~/.bash_projekte'
alias bf='vim ~/.bash_funktionen'

#************************************************
#               netzwerk verbindung
#************************************************

# ip lokal
alias ipl='ipconfig getifaddr en0'

# ip world
alias ipw='curl ipinfo.io/ip'

# wget autoresume
alias wget='wget -c'


#************************************************
#               cd shortcuts
#************************************************
# lazy
alias cdr='cd /'
alias cdv='cd /var'
alias cdb='cd /bin'
alias cdd='cd /dev'
alias cdo='cd /opt'
alias cdu='cd /usr'
alias cdt='cd /tmp'
alias cde='cd /etc'
alias cdc='cd ~/.config'
alias cds='cd /.scripts'

# windoof alias
alias cdw='cd /windoof'

#************************************************
#               verbesserte ls's
#************************************************

# verbesserte ls's
alias ls='ls -h --group-directories-first --color'
alias ll='ls -l'
alias la='ll -A'

#************************************************
#               alias help
#************************************************

alias ali-help='cat ~/.bash_aliases'
alias udo='sudo'
