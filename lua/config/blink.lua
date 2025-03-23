return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  build = 'cargo build --release',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'enter' },

    appearance = {
      nerd_font_variant = 'mono',
      use_nvim_cmp_as_default = true,
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    completion = {
      keyword = {
        range = 'full'
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250
      },
      trigger = {
        show_on_insert_on_trigger_character = false,
        show_on_blocked_trigger_characters = { '"', "'", '(', ')', '{', '}', '[', ']', '\n', '\t', ' ' },
        show_on_x_blocked_trigger_characters = { '"', "'", '(', ')', '{', '}', '[', ']', '\n', '\t', ' ' },
      }
    },

    cmdline = {
      enabled = true,
      -- use 'inherit' to inherit mappings from top level `keymap` config
      keymap = { preset = 'cmdline' },
      sources = function()
        local type = vim.fn.getcmdtype()
        if type == '/' or type == '?' then return { 'buffer' } end
        if type == ':' or type == '@' then return { 'cmdline' } end
        return {}
      end,
      completion = {
        trigger = {
          show_on_blocked_trigger_characters = {},
          show_on_x_blocked_trigger_characters = {},
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
        menu = { auto_show = true },
        ghost_text = { enabled = false }
      }
    },
    sources = {
      default = {
        'lsp',
        'path',
        'snippets',
        'buffer',
      },
    },
  },
  opts_extend = { "sources.default" }
}
