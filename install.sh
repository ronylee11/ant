#!/bin/sh
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

cp -r $SCRIPT_DIR/.config ~
cp -r $SCRIPT_DIR/.local ~
mkdir -p ~/.tmux
cp $SCRIPT_DIR/.tmux/iceberg_minimal.tmux.conf ~/.tmux/iceberg_minimal.tmux.conf
