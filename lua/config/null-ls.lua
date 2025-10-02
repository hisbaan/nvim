return {
    'nvimtools/none-ls.nvim',
    config = function()
        local null_ls = require("null-ls")
        local flags = require('flags')

        local sources = {}
        if flags.lsp.formatters.yamlfmt then vim.list_extend(sources, null_ls.builtins.formatting.yamlfmt) end
        if flags.lsp.formatters.prettier then vim.list_extend(sources, null_ls.builtins.formatting.prettier) end
        if flags.lsp.formatters.sql_formatter then vim.list_extend(sources, null_ls.builtins.formatting.sql_formatter) end

        require("null-ls").setup({
            sources = sources,
        })
    end
}
