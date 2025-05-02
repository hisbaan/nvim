return {
  "folke/snacks.nvim",
  opts = {
    ---@type snacks.Config
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = "", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = "", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = "󰒲", key = "z", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = "", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { icon = "", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = "", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    }
  }
}
