#! /usr/bin/env bash
shopt -s extglob
# turns off cowbell
xset -b

cd "$HOME" || return
eval "$(thefuck --alias)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$HOME/.nvm/bash_completion"

export EDITOR='vim'

# schneide float ab -> int
fk_cutfloat()
{
	float=$1
	int=${float%.*}
	echo "$int"
}


# openssl password generator
fk_passwdgen() {
	openssl rand -base64 "$1"
}

# cd .. n times
.. ()
{
    	local arg=${1:-1};
    	local dir=""
    	while [ "$arg" -gt 0 ]; do
        	dir="../$dir"
        	arg=$(("$arg" - 1));
    	done
    	cd $dir >&/dev/null || echo "Directory does not exist" && exit 2
}

#start command in bg, redir output to /dev/null
fk_s()
{
	("$@" & disown ) >/dev/null 2>&1 </dev/null
  	which "$1" >/dev/null 2>&1
}

fk_zathura()
{
    fk_s zathura "$1"
}

fk_extract()
{
  	if [ -f "$1" ] ; then
	      	case "$1" in
        	  	*.tar.bz2)   tar xvjf "$1"    ;;
        		  *.tar.gz)    tar xvzf "$1"    ;;
		          *.bz2)       bunzip2 "$1"     ;;
        		  *.rar)       rar x "$1"       ;;
	        	  *.gz)        gunzip "$1"      ;;
	          	*.tar)       tar xvf "$1"     ;;
        	  	*.tbz2)      tar xvjf "$1"    ;;
          		*.tgz)       tar xvzf "$1"    ;;
	          	*.zip)       unzip "$1"       ;;
        	  	*.Z)         uncompress "$1"  ;;
          		*.7z)        7z x "$1"        ;;
	          	*)           echo "don't know how to extract $1..." ;;
      		esac
  	else
      		echo "$1"" is not a valid file!"
  	fi
}

# wetter
weather()
{
	curl "https://wttr.in/$1"
}

fk_bandit()
{
	cat ~/bandit/bandit"$1"
	ssh bandit"$1"@bandit.labs.overthewire.org -p 2220
}

fk_addbanditkey()
{
    echo "$1" > ~/bandit/bandit"$2"
}

fk_alarm(){
    (speaker-test --frequency "$1" --test sine)& pid=$!;sleep 0.2;kill -9 $pid
}

#************************************************
#             Projektordner öffnen
#************************************************

# aktuelles projekt
alias cda='cd ~/.dev && echo $(tput setaf 1) No project specified'

# aktuelles zweitprojekt
alias cdzp='cd ~/.dev && echo $(tput setaf 1) No project specified'

# Projekteordner
alias cdp='cd ~/.dev/'
