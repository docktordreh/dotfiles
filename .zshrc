xset -b
autoload -U compinit promptinit
compinit
promptinit; prompt gentoo
zstyle ':completion::complete:*' use-cache 1
export ZSH="$HOME/.oh-my-zsh"
export TYPEWRITTEN_CURSOR="block"
ZSH_THEME="typewritten"
CASE_SENSITIVE="true"
plugins=(
git
ansible
docker
fzf
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='mvim'
fi

eval $(thefuck --alias)

export ANDROID_HOME=~/Android/Sdk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export EDITOR='emacsclient -t'
export VISUAL='emacsclient'

export FZF_BASE=/usr/bin/fzf
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH:$HOME/.local/bin:$HOME/go/bin"

# v = vim
alias v='vim'

# wget autoresume
alias wget='wget -c'

# verbesserte ls's
alias ls='ls -h --color'
alias ll='ls -l'
alias la='ll -A'

alias udo='doas'
alias doas='doas'
alias sudo='doas'
# aktuelles projekt
alias cda='cd ~/.dev/ek-chuah'
#'cd ~/.dev && echo $(tput setaf 1) No project specified'
# aktuelles zweitprojekt
alias cdzp='cd ~/.dev && echo $(tput setaf 1) No project specified'
# Projekteordner
alias cdp='cd ~/.dev/'

# schneide float ab -> int
fk_cutfloat()
{
	float=$1
	int=${float%.*}
	echo $int
}

# openssl password generator
fk_passwdgen() {
	openssl rand -base64 "$1"
}

# cd & ls
fk_cl()
{
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}

# nano empty existing file
fk_cnano()
{
	echo "" > $1
	nano $1
}

# mkdir -p & cd
fk_mkcd()
{
  	mkdir -p "$1"
  	cd "$1"
}

# cd .. n times
.. ()
{
    	local arg=${1:-1};
    	local dir=""
    	while [ $arg -gt 0 ]; do
        	dir="../$dir"
        	arg=$(($arg - 1));
    	done
    	cd $dir >&/dev/null
}

#Grep process | Usage: psgrep <process>
fk_psgrep()
{
	ps axuf | grep -v grep | grep "$@" -i --color=auto;
}

#start command in bg, redir output to /dev/null
fk_s()
{
	("$@" & disown ) >/dev/null 2>&1 </dev/null
  	which "$1" >/dev/null 2>&1
}

fk_zathura()
{
    fk_s zathura $1
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
	          	  *)           echo "don't know how to extract '"$1"'..." ;;
      		esac
  	else
      		echo "'"$1"' is not a valid file!"
  	fi
}

# wetter
weather()
{
	curl http://wttr.in/$1
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
    (speaker-test --frequency $1 --test sine)& pid=$!;sleep 0.2;kill -9 $pid
}
