return {
    dir = "/home/hisbaan/projects/dataview.nvim",
    -- event = {
    --     "BufEnter " .. vim.fn.expand "~" .. "/Documents/obsidian**",
    -- },
    enabled = true,
    ft = { "markdown" },
    --- @module 'dataview'
    --- @type dataview.Config
    opts = {
        vault_dir = "~/Documents/obsidian/",
        buffer_kind = "float",
    }
}
