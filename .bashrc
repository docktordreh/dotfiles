#[valentin@schosswaermer ~]$ xrandr --output VGA1 --off --output LVDS1 --auto 
#export PATH="${PATH}:${HOME}/.local/bin/"
# pywal
neofetch

cutfloat(){
	float=$1
	int=${float%.*}
	echo $int
}

#change list: cd and ls
cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}

# makedirectory change directory
function mkcd () {
  mkdir -p "$1"
  cd "$1"
}

# cd .. n times
function .. ()
{
    local arg=${1:-1};
    local dir=""
    while [ $arg -gt 0 ]; do
        dir="../$dir"
        arg=$(($arg - 1));
    done
    cd $dir >&/dev/null
}
# goes to par dir with spec. name
function ... ()
{
    if [ -z "$1" ]; then
        return
    fi
    local maxlvl=16
    local dir=$1
    while [ $maxlvl -gt 0 ]; do
        dir="../$dir"
        maxlvl=$(($maxlvl - 1));
        if [ -d "$dir" ]; then
            cd $dir >&/dev/null
        fi
    done
}

alias i='sudo pacman -S'
alias u='sudo pacman -Rns'
alias upgrade='pacman -Syyu --noconfirm'
alias upaur='pacaur -Syyu --noconfirm'

# better ls'es
alias ls='ls -h --group-directories-first --color'
alias ll='ls -l'
alias la='ll -A'

#duf shows largest folders
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

#start command in bg, redir output to /dev/null
s(){
  ("$@" & disown ) >/dev/null 2>&1 </dev/null
  which "$1" >/dev/null 2>&1
}

# bash =!= vim
alias :wq="echo 'YOU ARE NOT IN VIM , DUDE ! get a coffee !'"

## WIKIPEDIA SEARCH FUNCTION ##
wikipediaSearch() {
echo -n -e "\n============================================\n\tWelcome to WikiPedia Search"; echo ""; i=1 ; for line in $(lynx --dump "http://de.wikipedia.org/w/index.php?title=Special%3ASearch&profile=default&search=$1&fulltext=Search" | grep http://en.wikipedia.org/wiki | cut -c7-); do echo $i $line; lines[$i]=$line ;  i=$(($i+1)); done ; echo -n -e "\n============================================\n\tPlease select the link to open - "; read answer; w3m ${lines[$answer]}
}

## ARCHWIKI SEARCH FUNCTION ##
archSearch() {
echo -n -e "\n============================================\n\tWelcome to Arch Wiki Search"; echo ""; i=1 ; for line in $(lynx --dump "https://wiki.archlinux.org/index.php?title=Special%3ASearch&profile=default&search=$1" | grep https://wiki.archlinux.org/ | cut -c7-); do echo $i $line; lines[$i]=$line ; i=$(($i+1)); done ; echo -n -e "\n============================================\n\tPlease select the link to open - "; read answer; w3m ${lines[$answer]}
}
 
## EXTRACT FUNCTION ## | Usage: extract <file>
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# wetter
wttr () {
curl http://wttr.in/$1
}

#List Realtime Soccer Results | Usage: score
score() { 
 watch -n10 --no-title "w3m http://www.livescore.com/ |awk '/live [0-9H]+[^ ]/,/red cards/'" ;
}

#Grep process | Usage: psgrep <process>
psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; 
}

alias sudo='sudo '

# remove $(useless)
alias useless='pacman -Qtdq' 
alias remove='pacman -Rscn'

loop() {
icon=$1
notify-send -i $icon -h int:value:$1 -h string:synchronous:my-progress $3 -t $4
}
alias android-connect="mtpfs -o allow_other /media/p20lite"
alias android-disconnect="fusermount -u /media/p20lite"
