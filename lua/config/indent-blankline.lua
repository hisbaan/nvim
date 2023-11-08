return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        require("ibl").setup({
            scope = {
                enabled = false,
            },
            indent = {
                char = "│",
            },
            exclude = {
                filetypes = {
                    "lspinfo",
                    "org",
                    "lazy",
                    "md",
                    "man",
                    "help",
                    "gitcommit",
                    "TelescopePrompt",
                    "TelescopeResults",
                    "",
                }
            }
        })
    end
}
