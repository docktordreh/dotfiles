#!/bin/zsh
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"

export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"

export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"

export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.config/local/share}/cargo"

export GOPATH="${XDG_DATA_HOME:-$HOME/.config/local/share}/go"

export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"

export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.config/local/share}/gnupg"

export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.config/local/share}/pass"

export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/readline/inputrc"

export PYLINTHOME="${XDG_CACHE_HOME:-$HOME/.config/cache}/pylint"

export LESSHISTFILE=-

# This is the list for lf icons:
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.webp=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpe=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.tif=🖼:\
*.tiff=🖼:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.m=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
*.jar=♨:\
*.java=♨:\
"
