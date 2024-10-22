local opts = require('opts')

return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<Leader><Space>', '<Cmd>Telescope find_files<CR>', opts, desc = "Find files" },
        { '<Leader>bs', '<Cmd>Telescope buffers<CR>', opts, desc = "Search Buffers" },
        { '<Leader>tg', '<Cmd>Telescope live_grep<CR>', opts, desc = "Live grep" },
        { '<Leader>.', "<Cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opts, desc = "File browser" },
    },
    config = function()
        local actions = require("telescope.actions")
        local custom_actions = {}
        local telescope = require("telescope")

        telescope.load_extension("projects")
        telescope.load_extension("ui-select")
        telescope.load_extension("file_browser")
        telescope.load_extension("fzf")

        telescope.setup {
            defaults = {
                file_ignore_patterns = { "node_modules", "%.jpg", "%.png" },
                vimgrep_arguments = {
                    "rg", "--follow", "--color=never", "--no-heading",
                    "--with-filename", "--line-number", "--column", "--smart-case"
                },
                mappings = {
                    i = {
                        -- Close on first esc instead of gonig to normal mode
                        ["<esc>"] = actions.close,
                        ["<A-q>"] = actions.send_selected_to_qflist,
                        ["<C-c>"] = actions.smart_send_to_qflist,
                        ["<s-tab>"] = actions.toggle_selection
                            + actions.move_selection_next,
                        ["<tab>"] = actions.toggle_selection
                            + actions.move_selection_previous,
                        ["<cr>"] = custom_actions.multi_selection_open,
                        ["<c-v>"] = custom_actions.multi_selection_open_vsplit,
                        ["<c-s>"] = custom_actions.multi_selection_open_split,
                        ["<c-t>"] = custom_actions.multi_selection_open_tab
                    },
                    n = {
                        ["<s-tab>"] = actions.toggle_selection
                            + actions.move_selection_next,
                        ["<tab>"] = actions.toggle_selection
                            + actions.move_selection_previous,
                        ["<A-q>"] = actions.send_selected_to_qflist,
                        ["<C-c>"] = actions.send_to_qflist,
                        ["<cr>"] = custom_actions.multi_selection_open,
                        ["<c-v>"] = custom_actions.multi_selection_open_vsplit,
                        ["<c-s>"] = custom_actions.multi_selection_open_split,
                        ["<c-t>"] = custom_actions.multi_selection_open_tab
                    }
                },
                selection_caret = " ",
                prompt_prefix = "  ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "descending",
                layout_strategy = "flex",
                layout_config = {
                    width = 0.75,
                    prompt_position = "bottom",
                    preview_cutoff = 120,
                    horizontal = { mirror = false },
                    vertical = { mirror = true }
                },
                file_sorter = require "telescope.sorters".get_fzf_sorter,
                generic_sorter = require "telescope.sorters".get_fzf_sorter,
                winblend = 0,
                border = {},
                -- borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
                color_devicons = true,
                use_less = true,
                set_env = { ["COLORTERM"] = "truecolor" },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {

                    }
                }
            }
        }
    end
}
