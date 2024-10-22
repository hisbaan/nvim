return {
    'folke/which-key.nvim',
    enabled = false,
    config = function()
        -- disable v
        -- local presets = require("which-key.plugins.presets")
        -- presets.operators["v"] = nil
        require("which-key").setup {
            plugins = {
                marks = true,        -- shows a list of your marks on ' and `
                registers = true,    -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                spelling = {
                    enabled = true,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 20 -- how many suggestions should be shown in the list?
                },
                -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                -- No actual key bindings are created
                presets = {
                    operators = false,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
                    motions = false,      -- adds help for motions
                    text_objects = false, -- help for text objects triggered after entering an operator
                    windows = false,      -- default bindings on <c-w>
                    nav = false,          -- misc bindings to work with windows
                    z = true,             -- bindings for folds, spelling and others prefixed with z
                    g = true              -- bindings for prefixed with g
                },
            },
            -- add operators that will trigger motion and text object completion
            -- to enable all native operators, set the preset / operators plugin above
            icons = {
                breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                separator = "➜", -- symbol used between a key and it's label
                group = "+" -- symbol prepended to a group
            },
            win = {
                border = "none",         -- none, single, double, shadow
                position = "bottom",     -- bottom, top
                margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
                padding = { 2, 2, 2, 2 } -- extra window padding [top, right, bottom, left]
            },
            layout = {
                height = { min = 4, max = 25 }, -- min and max height of the columns
                width = { min = 20, max = 50 }, -- min and max width of the columns
                spacing = 3,                    -- spacing between columns
                align = "left"                  -- align columns left, center or right
            },
            show_help = true,                   -- show help message on the command line when the popup is visible
            -- triggers = "auto", -- automatically setup triggers
            triggers = { "<leader>" },          -- or specify a list manually
        }

        local wk = require("which-key")
        local default_options = { noremap = true, silent = true }
        wk.add(
            {
                { "<leader>b",   desc = "view buffers" },
                { "<leader>c",   group = "context" },
                { "<leader>ct",  desc = "toggle Treesitter Context" },
                { "<leader>d",   group = "dap" },
                { "<leader>dB",  desc = "set breakpoint" },
                { "<leader>db",  desc = "toggle breakpoint" },
                { "<leader>dc",  desc = "continue" },
                { "<leader>di",  desc = "step into" },
                { "<leader>dl",  desc = "run last" },
                { "<leader>do",  desc = "step out" },
                { "<leader>dot", desc = "file browser" },
                { "<leader>dr",  desc = "open REPL" },
                { "<leader>dv",  desc = "step over" },
                { "<leader>g",   group = "neogit" },
                { "<leader>gg",  desc = "Neogit" },
                { "<leader>i",   desc = "invert text" },
                { "<leader>l",   group = "lsp" },
                { "<leader>la",  desc = "code action" },
                { "<leader>lf",  desc = "format code" },
                { "<leader>lg",  desc = "generate function documentation" },
                { "<leader>lr",  desc = "rename variable" },
                { "<leader>lt",  desc = "toggle lsp lines" },
                { "<leader>s",   group = "session" },
                { "<leader>sS",  desc = "save session" },
                { "<leader>sd",  desc = "delete session" },
                { "<leader>sr",  desc = "restore session" },
                { "<leader>ss",  desc = "search session" },
                { "<leader>td",  desc = "telescope todo" },
                { "<leader>te",  desc = "external terminal" },
                { "<leader>tt",  desc = "terminal buffer" },
            })
    end
}
