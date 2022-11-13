set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

"source $HOME/.vimrc
source $HOME/.config/nvim/.vimrc


" Load lua config files
lua require("config")
