#!/bin/sh
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

cp ~/.vimrc $SCRIPT_DIR
cp -r ~/.config/alacritty $SCRIPT_DIR/.config
cp -r ~/.config/nvim $SCRIPT_DIR/.config
cp -r ~/.config/zathura $SCRIPT_DIR/.config
cp -r ~/.config/tmux/tmux.conf $SCRIPT_DIR/.config/tmux
cp -r ~/.config/fish/functions/* $SCRIPT_DIR/.config/fish/functions
