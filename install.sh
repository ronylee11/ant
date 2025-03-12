#!/bin/sh
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
TPM=$HOME/.tmux/plugins/tpm

git submodule init
git submodule update
cp -r $SCRIPT_DIR/.config ~
cp -r $SCRIPT_DIR/.local ~
if [ ! -d "$TPM" ]; then
    mkdir -p ~/.tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
cp $SCRIPT_DIR/.tmux/iceberg_minimal.tmux.conf ~/.tmux/iceberg_minimal.tmux.conf
cp $SCRIPT_DIR/.zshrc ~
mkdir -p $SCRIPT_DIR/temp
git clone https://github.com/oh-my-fish/oh-my-fish.git $SCRIPT_DIR/temp/oh-my-fish
$SCRIPT_DIR/temp/oh-my-fish/bin/install --offline
rm -rf $SCRIPT_DIR/temp
fish $SCRIPT_DIR/update_fishbone.fish
