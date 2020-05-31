#!/bin/sh
tmux start-server
tmux new-session \; \
    split-window -v -p 70 \; \
    split-window -h -p 40 \; \
    send-keys 'ranger' C-m \; \
    new-window 'neomutt' \; \
    new-window 'emacs -nw' \; \
    new-window 'ncmpcpp' \; \
    new-window 'asciiquarium'; 