#!/bin/sh
tmux new-session \; \
    split-window -v -p 70 \; \
    split-window -h -p 30 \; \
    send-keys 'ranger' C-m \; \
    new-window 'neomutt' \; \
    new-window 'emacs -nw' \; 
