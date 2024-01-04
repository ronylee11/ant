-- Load keymaps
--require('set')
require('remap')
-- Load treesitter config
require('treesitter/languages')
require('treesitter/highlight')
-- Load telescope
require('telescope/fzf-native')
require('telescope/live_grep_args')
require('telescope/filebrowser')
require('telescope/notify')
require('telescope/dap')
-- Debug
require('dap/dap-vscode-js')
--require('dap/init')
-- Notifications
require('logger')
-- Startup
require('startup').setup()
-- Leetcode
require('leetcode').setup({
  lang = "javascript",
})
-- Gitsigns
require('gitsigns').setup({
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 0,
  },
})
