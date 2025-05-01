return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'catppuccin/nvim'
  },
  opts = function()
    local C = require("catppuccin.palettes").get_palette()
    local flavour = require("catppuccin").flavour
    local transparent = require("catppuccin").options.transparent_background

    local mode_colors = {
      n = C.lavender,
      i = C.green,
      v = C.flamingo,
      V = C.flamingo,
      [""] = C.flamingo,
      c = C.peach,
      R = C.maroon,
      t = C.green,
    }

    local sett = {
      text = flavour == "latte" and C.base or C.mantle,
      bg = transparent and "NONE" or (flavour == "latte" and C.crust or C.crust),
      diffs = C.mauve,
      extras = C.overlay1,
      curr_file = C.maroon,
      curr_dir = C.flamingo,
      inactive_bg = C.base,
      show_modified = false,
      show_lazy_updates = false,
    }

    local icons = {
      mode_icon = "",
      dir = "󰉖",
      file = "󰈙",
      lsp = {
        server = "󰅡",
        error = "",
        warning = "",
        info = "",
        hint = "",
      },
      git = {
        branch = "",
        added = "",
        changed = "",
        removed = "",
      },
      left_sep = "",
      right_sep = "",
    }

    return {
      options = {
        theme = {
          normal = {
            a = { fg = sett.text, bg = mode_colors[vim.fn.mode()], gui = "bold" },
            b = { fg = sett.extras, bg = sett.bg },
            c = { fg = sett.text, bg = sett.bg },
          },
          insert = { a = { fg = sett.text, bg = mode_colors.i, gui = "bold" } },
          visual = { a = { fg = sett.text, bg = mode_colors.v, gui = "bold" } },
          replace = { a = { fg = sett.text, bg = mode_colors.R, gui = "bold" } },
          command = { a = { fg = sett.text, bg = mode_colors.c, gui = "bold" } },
          inactive = {
            c = { fg = sett.inactive_bg, bg = sett.inactive_bg },
          }
        },
        section_separators = { left = icons.left_sep, right = icons.right_sep },
        component_separators = {},
        disabled_filetypes = { 'NvimTree', 'Avante' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      sections = {
        -- left sections
        lualine_a = {
          {
            function() return icons.mode_icon end
          },
          {
            'mode',
            padding = { left = 0, right = 1 }
          }
        },
        lualine_b = {
          -- TODO not sure if I care about this
          -- {
          --   'diff',
          --   symbols = {
          --     added = " " .. icons.git.added .. " ",
          --     modified = " " .. icons.git.changed .. " ",
          --     removed = " " .. icons.git.removed .. " ",
          --   },
          --   diff_color = {
          --     added = { fg = sett.text, bg = sett.diffs },
          --     modified = { fg = sett.text, bg = sett.diffs },
          --     removed = { fg = sett.text, bg = sett.diffs },
          --   },
          --   padding = { left = 0, right = 1 },
          -- }
        },
        lualine_c = {
          {
            'progress',
            color = { fg = sett.extras, bg = sett.bg },
            padding = { left = 1, right = 0 },
          },
          {
            'location',
            color = { fg = sett.extras, bg = sett.bg },
          },

          -- middle section
          {
            function() return "%=" end
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            symbols = {
              error = " " .. icons.lsp.error .. " ",
              warn = " " .. icons.lsp.warning .. " ",
              info = " " .. icons.lsp.info .. " ",
              hint = " " .. icons.lsp.hint .. " ",
            },
            diagnostics_color = {
              error = { fg = C.red },
              warn = { fg = C.yellow },
              info = { fg = C.sky },
              hint = { fg = C.rosewater },
            },
          }
        },

        -- right sections
        lualine_x = {
          {
            "branch",
            icon = icons.git.branch,
            color = { fg = sett.extras, bg = sett.bg },
            padding = { left = 0, right = 1 },
          },
          {
            "lsp_status",
            ignore_lsp = { 'null-ls' },
            icon = icons.lsp.server,
            symbols = {
              done = "",
              separator = "",
            },
            color = { fg = sett.extras, bg = sett.bg },
            padding = { left = 0, right = 1 },
            -- {
            --   function()
            --     local clients = vim.lsp.get_clients({ bufnr = 0 })
            --     if #clients == 0 then return "" end
            --     return assets.lsp.server .. " " .. table.concat(vim.tbl_map(function(c) return c.name end, clients), "|")
            --   end,
            --   color = { fg = sett.extras, bg = sett.bkg },
            -- },
          }
        },
        lualine_y = {
          {
            -- filename
            function()
              local fname = vim.fn.expand("%:t")
              local ext = vim.fn.expand("%:e")
              local icon = icons.file
              local present, devicons = pcall(require, "nvim-web-devicons")
              if present then
                icon = devicons.get_icon(fname, ext) or icon
              end
              return icon .. " " .. fname
            end,
            color = { fg = sett.text, bg = sett.curr_file },
          },
        },
        lualine_z = {
          {
            -- cwd
            function()
              local dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
              return icons.dir .. " " .. dir
            end,
            color = { fg = sett.text, bg = sett.curr_dir },
          },
        },
      }
    }
  end
}
