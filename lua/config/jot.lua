local opts = require('opts')

return {
    'hisbaan/jot.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
        { '<leader>j', '<Cmd>Jot<CR>', opts, desc = "Jot" }
    },
    config = function()
        require('jot').setup({
            search_dir = "~/Documents/obsidian/",
            search_depth = 5,
            hide_search_dir = true,
        })
    end
}
