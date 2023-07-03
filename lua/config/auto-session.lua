local opts = require('opts')

return {
    'rmagatti/auto-session',
    keys = {
        { '<leader>ss', '<Cmd>Autosession search<CR>', opts, desc = "Search Sessions" },
        { '<leader>sd', '<Cmd>SessionDelete<CR>', opts, desc = "Delete Session" },
        { '<leader>sr', '<Cmd>SessionRestore<CR>', opts, desc = "Restore Session" },
        { '<leader>sS', '<Cmd>SessionSave<CR>', opts, desc = "Save Session" },
    },
    lazy = false,
    config = function()
        require("auto-session").setup {
            log_level = "error",
            auto_session_suppress_dirs = { "~/", "~/Downloads", "/", "~/.config/nvim" },
            post_restore_cmds = {
                function()
                    vim.opt.cmdheight = 1
                end
            }
        }

        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
    end
}
