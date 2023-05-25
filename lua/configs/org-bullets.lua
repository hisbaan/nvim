return {
    'akinsho/org-bullets.nvim',
    ft = { 'org' },
    config = function()
        require("org-bullets").setup {
            concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
            symbols = {
                headlines = { "⁖", },
                checkboxes = {
                    cancelled = { "", "OrgCancelled" },
                    done = { "X", "OrgDone" },
                    todo = { " ", "OrgTODO" },
                },
            }
        }
    end
}
