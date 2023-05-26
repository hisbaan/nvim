return {
    'smjonas/live-command.nvim',
    config = function()
        require('live-command').setup({
            commands = {
                Norm = { cmd = "norm" }
            },
            -- defaults = {
            --     hl_groups = {
            --         insertion = "DiffChange",
            --         deletion = "DiffChange",
            --         change = "DiffChange",
            --     }
            -- }
        })
    end
}
