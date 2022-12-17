#!/bin/sh
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
TPM=$HOME/.tmux/plugins/tpm

cp -r $SCRIPT_DIR/.config ~
cp -r $SCRIPT_DIR/.local ~
if [ ! -d "$TPM" ]; then
    mkdir -p ~/.tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
cp $SCRIPT_DIR/.tmux/iceberg_minimal.tmux.conf ~/.tmux/iceberg_minimal.tmux.conf
