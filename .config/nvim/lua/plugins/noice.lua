require("noice").setup({
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = false,      -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
    },
    views = {
        cmdline_popup = {
            border = {
                padding = { 1, 2 },
            },
            filter_options = {},
            win_options = {},
        },
    },
    routes = {
        {
            filter = {
                event = "msg_show",
                any = {
                    { find = "%d+L, %d+B" },
                    { find = "; after #%d+" },
                    { find = "; before #%d+" },
                    { find = "^%d+ fewer lines$" },
                    { find = "^%d+ more lines$" },
                    { find = "^%d+ lines yanked$" },
                },
            },
            view = "mini",
        },
        {
            filter = {
                event = "lsp",
                any = {
                    { kind = "progress", find = "Validate documents" },
                    { kind = "progress", find = "Publish Diagnostics" },
                },
            },
            opts = { skip = true },
        },
    },
})
