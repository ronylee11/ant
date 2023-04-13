#!/bin/sh
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

cp ~/.config/nvim/.vimrc $SCRIPT_DIR/.config/nvim/.vimrc
cp -r ~/.config/alacritty $SCRIPT_DIR/.config
rm -r $SCRIPT_DIR/.config/nvim && cp -r ~/.config/nvim $SCRIPT_DIR/.config
cp -r ~/.config/zathura $SCRIPT_DIR/.config
cp -r ~/.config/tmux/tmux.conf $SCRIPT_DIR/.config/tmux
cp -r ~/.config/fish/functions/* $SCRIPT_DIR/.config/fish/functions
cp ~/.config/qutebrowser/autoconfig.yml $SCRIPT_DIR/.config/qutebrowser
cp -r ~/.config/qutebrowser/bookmarks $SCRIPT_DIR/.config/qutebrowser
cp ~/.config/qutebrowser/config.py $SCRIPT_DIR/.config/qutebrowser
cp -r ~/.config/qutebrowser/greasemonkey $SCRIPT_DIR/.config/qutebrowser
cp ~/.config/qutebrowser/quickmarks $SCRIPT_DIR/.config/qutebrowser
cp -r ~/.zshrc $SCRIPT_DIR/.zshrc
