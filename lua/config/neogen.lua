local opts = require('opts')

return {
    'danymat/neogen',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    keys = {
        { '<leader>lg', '<Cmd>Neogen<CR>', opts, desc = "Generate Comment" }
    },
    config = true
}
