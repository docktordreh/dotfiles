#!/bin/sh
tmux start-server
tmux new-session \; \
    send-keys 'vifm' C-m \; \
    split-window -v -p 70 \; \
    new-window 'neomutt' \; \
    new-window 'ncmpcpp' \; \
    new-window 'asciiquarium' \; \
    select-window -t 0 \; \
    select-pane -t 1; 
