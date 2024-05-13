local opts = require('opts')

return {
    'romgrk/barbar.nvim',
    enabled = true,
    lazy = false,
    keys = {
        { '<S-l>',       '<Cmd>BufferNext<CR>',         opts, desc = "Go to next buffer" },
        { '<S-h>',       '<Cmd>BufferPrevious<CR>',     opts, desc = "Go to previous buffer" },
        { '<Leader>bn',  '<Cmd>BufferNext<CR>',         opts, desc = "Go to next buffer" },
        { '<Leader>bp',  '<Cmd>BufferPrevious<CR>',     opts, desc = "Go to previous buffer" },
        { '<Leader>bmn', '<Cmd>BufferMoveNext<CR>',     opts, desc = "Swap current and next buffer" },
        { '<Leader>bmp', '<Cmd>BufferMovePrevious<CR>', opts, desc = "Swap current and previous buffer" },
        { '<Leader>bP',  '<Cmd>BufferPin<CR>',          opts, desc = "Pin buffer" },
        { '<Leader>bb',  '<Cmd>BufferPick<CR>',         opts, desc = "Buffer picking mode" },
        { '<Leader>bd',  '<Cmd>BufferClose<CR>',        opts, desc = "Buffer picking mode" },
    },
    dependencies = {
        'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    opts = {
        animation = true,
        auto_hide = true,
        tabpages = false,
        clickable = true,
        focus_on_close = 'left',
        separator_at_end = false,
        separator = { left = '▎', right = '' },
        icons = {
            button = '󰅖'
        },
        -- sidebar_filetypes = {
        --     NvimTree = true,
        -- },
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
}
