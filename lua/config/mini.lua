return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        -- indent scope highlighting
        require("mini.indentscope").setup({
            symbol = "│"
        })
    end
}
