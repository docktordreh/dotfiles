#!/bin/sh
tmux start-server
tmux new-session \; \
    split-window -v -p 70 \; \
    split-window -h -p 40 \; \
    send-keys 'vifm' C-m \; \
    select-pane -t 1 \; \
    new-window 'neomutt' \; \
    new-window 'ncmpcpp' \; \
    new-window 'asciiquarium'; 
