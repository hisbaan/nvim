local opts = require('opts')

return {
    'hisbaan/jot.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
        { '<leader>j', '<Cmd>Jot<CR>', opts, desc = "Jot" }
    },
    config = function()
        require('jot').setup({
            search_dir = "~/Documents/org/",
            search_depth = 2,
            hide_search_dir = true,
            post_open_hook = function() vim.cmd("normal zx") end,
        })
    end
}
