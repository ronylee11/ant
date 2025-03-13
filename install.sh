#!/bin/sh
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
TPM=$HOME/.tmux/plugins/tpm

# check if executables exist (node, npm, cmake, make, gcc, python3, python, bash-language-server)
if ! command -v node &> /dev/null
then
    echo "node could not be found"
    exit
fi
if ! command -v npm &> /dev/null
then
    echo "npm could not be found"
    exit
fi
if ! command -v cmake &> /dev/null
then
    echo "cmake could not be found"
    exit
fi
if ! command -v make &> /dev/null
then
    echo "make could not be found"
    exit
fi
if ! command -v gcc &> /dev/null
then
    echo "gcc could not be found"
    exit
fi
if ! command -v python3 &> /dev/null
then
    echo "python3 could not be found"
    exit
fi
if ! command -v python &> /dev/null
then
    echo "python could not be found"
    exit
fi
if ! command -v bash-language-server &> /dev/null
then
    echo "bash-language-server could not be found"
    exit
fi

git submodule init
git submodule update
cp -r $SCRIPT_DIR/.config ~
cp -r $SCRIPT_DIR/.local ~
if [ ! -d "$TPM" ]; then
    mkdir -p ~/.tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
mkdir -p ~/.fonts
cp -r $SCRIPT_DIR/.fonts/* ~/.fonts
cp $SCRIPT_DIR/.tmux/iceberg_minimal.tmux.conf ~/.tmux/iceberg_minimal.tmux.conf
cp $SCRIPT_DIR/.zshrc ~
mkdir -p $SCRIPT_DIR/temp
git clone https://github.com/oh-my-fish/oh-my-fish.git $SCRIPT_DIR/temp/oh-my-fish
$SCRIPT_DIR/temp/oh-my-fish/bin/install --offline
rm -rf $SCRIPT_DIR/temp
fish $SCRIPT_DIR/.misc/update_fishbone.fish
