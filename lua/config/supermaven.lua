return {
  "supermaven-inc/supermaven-nvim",
  enabled = require('flags').plugins.supermaven,
  config = true,
  lazy = false,
  opts = function()
    local C = require("catppuccin.palettes").get_palette()

    return {
      keymaps = {
        accept_suggestion = "<C-l>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = {},
      color = {
        suggestion_color = C.overlay0,
      },
      log_level = "info",
      disable_keymaps = false,
      condition = function()
        return true
      end,
    }
  end
}
