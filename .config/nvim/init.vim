set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" Load treesitter config
lua << EOF
--require('plugin-config/treesitter') 
require('plugin-config/highlight') 
EOF
