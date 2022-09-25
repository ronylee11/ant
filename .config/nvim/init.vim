set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source /home/cleff/.vimrc

" Load lua config files
lua << EOF
-- Load treesitter config
require('config/treesitter/languages')
require('config/treesitter/highlight') 
-- Load telescope
require('config/telescope/fzf-native')
require('config/telescope/live_grep_args')
EOF
