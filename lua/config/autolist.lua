return {
    "gaoDean/autolist.nvim",
    ft = {
        "markdown",
        "text",
        "plaintex",
    },
    config = function()
        local list_patterns = {
            unordered = "[-+]", -- - +
            digit = "%d+[.)]", -- 1. 2. 3. ...
            ascii = "%a[.)]", -- a) b) c) ...
            roman = "%u*[.)]", -- I. II. III. ...
        }

        require("autolist").setup({
            enabled = true,
            colon = { -- if a line ends in a colon
                indent = false, -- if in list and line ends in `:` then create list
                indent_raw = false, -- above, but doesn't need to be in a list to work
                preferred = "-", -- what the new list starts with (can be `1.` etc)
            },
            cycle = { -- Cycles the list type in order
                "-",   -- whatever you put here will match the first item in your list
                "1.",  -- this says that if your list starts with a `*` it would go to `1.`
                "1)",  -- this all leverages the power of recalculate.
                "a)",  -- i spent many hours on that function
                "I.",  -- try it, change the first bullet in a list to `a)`, and press recalculate
            },
            lists = {
                markdown = {
                    list_patterns.unordered,
                    list_patterns.digit,
                    list_patterns.ascii,
                    list_patterns.roman,
                },
                text = {
                    list_patterns.unordered,
                    list_patterns.digit,
                    list_patterns.ascii,
                    list_patterns.roman,
                },
                plaintex = { list_patterns.latex_item },
            },
            -- checkbox = {
            --     left = "%[", -- the left checkbox delimiter (you could change to "%(" for brackets)
            --     right = "%]", -- the right checkbox delim (same customisation as above)
            --     fill = "x", -- if you do the above two customisations, your checkbox could be (x) instead of [x]
            -- },
        })

        -- vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
        -- vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
        -- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
        vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
        vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
        vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
        vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
        -- vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")

        -- cycle list types with dot-repeat
        vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
        vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

        -- functions to recalculate list on edit
        -- vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
        -- vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
        -- vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
        -- vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
    end,
}
