#!/bin/sh

for script in "$(dirname "$0")"/.local/bin/*; do
    [ ! -d "$HOME/.local/bin" ]  && mkdir -p "$HOME/.local/bin"
    ln -s "$script" "$HOME/.local/bin"
done

[ -d "$HOME/.config" ] && mv "$HOME/.config" "$HOME/.config.bak"

ln -s "$(dirname "$0")/.config" "$HOME"
