xset -b
#[valentin@schosswaermer ~]$ xrandr --output VGA1 --off --output LVDS1 --auto 
export PS1="\[$(tput bold)\][\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;2m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;33m\]\w\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"
#export PATH="${PATH}:${HOME}/.local/bin/"
# pywal
neofetch

cutfloat(){
	float=$1
	int=${float%.*}
	echo $int
}
# passwd gen
getpass() {
	openssl rand -base64 "$1"
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

#start command in bg, redir output to /dev/null
s(){
  ("$@" & disown ) >/dev/null 2>&1 </dev/null
  which "$1" >/dev/null 2>&1
}

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

#Grep process | Usage: psgrep <process>
psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; 
}

alias sudo='sudo '


loop() {
icon=$1
notify-send -i $icon -h int:value:$1 -h string:synchronous:my-progress $3 -t $4
}
alias v='vim'
alias android-connect="mtpfs -o allow_other /media/p20lite"
alias android-disconnect="fusermount -u /media/p20lite"
alias ipi='ipconfig getifaddr en0'
alias ipe='curl ipinfo.io/ip'
alias brc='vim /$HOME/.bashrc'
alias i3c='vim /$HOME/.config/i3/config'
# wget resume
alias wget='wget -c'
alias i='sudo pacman -S'
alias u='sudo pacman -Rns'
alias upgrade='pacman -Syyu --noconfirm'
alias upaur='yay -Syyu --noconfirm'

# better ls'es
alias ls='ls -h --group-directories-first --color'
alias ll='ls -l'
alias la='ll -A'

#duf shows largest folders
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

# remove $(useless)
alias useless='pacman -Qtdq' 
alias remove='pacman -Rscn'
cnano(){
  echo "" > $1
  nano $1

}
cvim(){
  echo "" > $1
  vim $1
}

bandit(){
	cat ~/bandit/bandit"$1"
	ssh bandit"$1"@bandit.labs.overthewire.org -p 2220
}
