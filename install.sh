#!/bin/sh
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

cp $SCRIPT_DIR/.vimrc ~
cp -r $SCRIPT_DIR/.config ~
cp $SCRIPT_DIR/.local ~
