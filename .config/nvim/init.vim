set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

"source $HOME/.vimrc
source /home/cleff/.config/nvim/.vimrc


" Load lua config files
lua require("init")
