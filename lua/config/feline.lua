return {
    'feline-nvim/feline.nvim',
    config = function()
        vim.opt.termguicolors = true
        require("feline").setup {
            components = require("catppuccin.groups.integrations.feline").get(),
        }
    end
}
