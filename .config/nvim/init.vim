set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source /home/cleff/.vimrc

" Load lua config files
lua << EOF
-- Load treesitter config
require('config/languages')
require('config/highlight') 
-- Load telescope
require('telescope')
EOF
