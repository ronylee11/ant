local nnoremap = require("keymap").nnoremap

nnoremap("<leader>pv", "<cmd>:wincmd v<bar> :Ex <bar> :vertical resize 30<CR>")
nnoremap("<leader>=", "<cmd>:vertical resize +5<CR>")
nnoremap("<leader>-", "<cmd>:vertical resize -5<CR>")
