local opts = require('opts')

return {
    'danymat/neogen',
    keys = {
        { '<leader>lg', '<Cmd>Neogen<CR>', opts, desc = "Generate Comment" }
    },
    config = true
}
