return {
    'williamboman/mason.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    config = function()
        require("mason").setup {
            ui = {
                border = "none", -- none, rounded, single, double, etc.
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            },
        }
        require("mason-lspconfig").setup {
            ensure_installed = {
                "bashls",
                "clangd",
                "cssls",
                "emmet_ls",
                "eslint",
                "hls",
                "html",
                "intelephense",
                "jdtls",
                "jsonls",
                "ltex",
                "lua_ls",
                "pyright",
                "rust_analyzer",
                "sqlls",
                "tailwindcss",
                "tsserver",
                "volar",
                "yamlls",
                "yamlfmt",
            }
        }
    end
}
