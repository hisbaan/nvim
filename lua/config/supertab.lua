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
    local luasnip = require('luasnip')
    local supermaven = require('supermaven-nvim.completion_preview')
    local copilot = require('copilot.suggestion')

    return {
      keys = {
        ['<Tab>'] = {
          {
            condition = function()
              return luasnip.expand_or_jumpable()
            end,
            action = function()
              luasnip.expand_or_jump()
            end
          },
          {
            condition = function()
              return copilot.is_visible()
            end,
            action = function()
              copilot.accept()
            end
          },
          {
            condition = function()
              return supermaven.has_suggestion()
            end,
            action = function()
              supermaven.on_accept_suggestion()
            end,
          }
        }
      }
    }
  end
}
