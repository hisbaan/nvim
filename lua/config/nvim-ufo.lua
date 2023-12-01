return {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    enabled = true,
    config = function()
        -- vim.wo.foldcolumn = '1'
        local filetypes = { org = '' }

        require("ufo").setup({
            open_fold_h1_timeout = 0,
            -- fold_virt_text_handler = handler,
            provider_selector = function(_, ft)
                return filetypes[ft] or { 'treesitter', 'indent' }
            end,
        })

        vim.o.foldlevel = 99
        vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
        vim.wo.foldenable = true

        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
        vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
        vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)
    end
}
