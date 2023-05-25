return {
    'ahmedkhalf/project.nvim',
    config = function()
        require("project_nvim").setup {
            patterns = { ".git", ".svn", "Makefile", "package.json" },
            detection_methods = { "lsp", "pattern" },
        }
    end
}
