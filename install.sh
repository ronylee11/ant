#!/bin/sh
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

cp $SCRIPT_DIR/.vimrc ~
cp -r $SCRIPT_DIR/.config ~
rm ~/.config/coc/extensions/coc-rainbow-fart-data/ffplay
sudo ln /bin/ffplay ~/.config/coc/extensions/coc-rainbow-fart-data/ffplay 
cp $SCRIPT_DIR/.local ~
