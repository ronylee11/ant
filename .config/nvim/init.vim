set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source /home/cleff/.vimrc

" Load treesitter config
lua << EOF
require('config/languages')
require('config/highlight') 
EOF
