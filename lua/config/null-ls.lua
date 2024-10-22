return {
    'nvimtools/none-ls.nvim',
    config = function()
        local null_ls = require("null-ls")
        require("null-ls").setup({
            sources = {
                null_ls.builtins.formatting.yamlfmt,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.sql_formatter,
            },
        })
    end
}
