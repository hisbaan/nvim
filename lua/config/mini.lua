return {
    'echasnovski/mini.nvim',
    version = false,
    enabled = false,
    config = function()
        -- indent scope highlighting
        require("mini.indentscope").setup({
            symbol = "│",
            options = {
                border = "top"
            },
        })
    end
}
