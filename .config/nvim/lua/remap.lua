local nnoremap = require("keymap").nnoremap

nnoremap("<leader>pv", "<cmd>:wincmd v<bar> :Ex <bar> :vertical resize 30<CR>")
nnoremap("<leader>=", "<cmd>:vertical resize +5<CR>")
nnoremap("<leader>-", "<cmd>:vertical resize -5<CR>")
nnoremap("<leader>ff", "<cmd>Telescope find_files<CR>")
nnoremap("<leader>lg", "<cmd>Telescope live_grep<CR>")
nnoremap("<leader>of", "<cmd>Telescope oldfiles<CR>")
nnoremap("<leader>fb", "<cmd>Telescope file_browser<CR>")
nnoremap("<leader>cs", "<cmd>Telescope colorscheme<CR>")
