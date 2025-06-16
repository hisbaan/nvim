return {
  "hisbaan/supertab.nvim",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "supermaven-inc/supermaven-nvim",
    "zbirenbaum/copilot.lua",
  },
  lazy = false,
  keys = {
    { "<Tab>", function() require("supertab").trigger("<Tab>") end, mode = "i", desc = "Supertab" }
  },
  --- @module 'supertab'
  --- @type fun():supertab.Config
  opts = function()
    local has_luasnip, luasnip = pcall(require, 'luasnip')
    local has_supermaven, supermaven = pcall(require, 'supermaven-nvim.completion_preview')
    local has_copilot, copilot = pcall(require, 'copilot.suggestion')

    return {
      keys = {
        ['<Tab>'] = {
          {
            condition = function()
              return has_luasnip and luasnip.expand_or_jumpable()
            end,
            action = function()
              luasnip.expand_or_jump()
            end
          },
          {
            condition = function()
              return has_supermaven and supermaven.has_suggestion()
            end,
            action = function()
              supermaven.on_accept_suggestion()
            end,
          },
          {
            condition = function()
              return has_copilot and copilot.is_visible()
            end,
            action = function()
              copilot.accept()
            end
          },
        }
      }
    }
  end
}
