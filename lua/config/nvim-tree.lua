local map_opts = require('opts')

return {
    'nvim-tree/nvim-tree.lua',
    keys = {
        { '<leader>f', '<Cmd>NvimTreeToggle<CR>', map_opts, desc = "NvimTree" },
    },
    lazy = false,
    -- each of these are documented in `:help nvim-tree.OPTION_NAME`
    -- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
    opts = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local function on_attach(bufnr)
            local api = require("nvim-tree.api")

            local function nvim_tree_opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- override default delete mapping with trash
            vim.keymap.set("n", "d", api.fs.trash, nvim_tree_opts("Trash"))
        end

        local function open_nvim_tree(data)
            local is_a_directory = vim.fn.isdirectory(data.file) == 1

            if is_a_directory then
                vim.cmd.cd(data.file)
                require("nvim-tree.api").tree.open()
                return
            end
        end
        vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

        return {
            on_attach = on_attach,
            auto_reload_on_write = true,
            create_in_closed_folder = false,
            disable_netrw = true,
            hijack_cursor = true,
            hijack_netrw = true,
            hijack_unnamed_buffer_when_opening = false,
            open_on_tab = false,
            sort_by = "name",
            reload_on_bufenter = true,
            update_cwd = false,
            respect_buf_cwd = true,
            hijack_directories = {
                enable = true,
                auto_open = true,
            },
            update_focused_file = {
                enable = false,
                update_cwd = false,
                ignore_list = { ".git", "node_modules", ".cache" }
            },
            diagnostics = {
                enable = false,
                show_on_dirs = false,
                show_on_open_dirs = true,
                debounce_delay = 50,
                severity = {
                    min = vim.diagnostic.severity.HINT,
                    max = vim.diagnostic.severity.ERROR,
                },
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            filters = {
                dotfiles = false,
                git_clean = false,
                no_buffer = false,
                custom = {},
                exclude = {},
            },
            trash = {
                cmd = "trash-put",
                require_confirm = true,
            },
            view = {
                adaptive_size = true,
                width = '15%',
                number = false,
                relativenumber = false,
                side = "left",
                signcolumn = "yes",
            },
            renderer = {
                add_trailing = true,
                group_empty = false,
                highlight_git = false,
                highlight_opened_files = "none",
                root_folder_modifier = ":~",
                indent_markers = {
                    enable = false,
                    icons = {
                        corner = "└ ",
                        edge = "│ ",
                        none = "  ",
                    },
                },
            },
            filesystem_watchers = {
                enable = true,
                debounce_delay = 50,
                ignore_dirs = {},
            },
            git = {
                enable = true,
                ignore = false,
                timeout = 400,
                show_on_dirs = true,
                show_on_open_dirs = true,
            },
            modified = {
                enable = false,
                show_on_dirs = true,
                show_on_open_dirs = true,
            },
            tab = {
                sync = {
                    open = false,
                    close = false,
                    ignore = {},
                },
            },
            ui = {
                confirm = {
                    remove = true,
                    trash = true,
                },
            },
            log = {
                enable = false,
                truncate = false,
                types = {
                    all = false,
                    config = false,
                    copy_paste = false,
                    dev = false,
                    diagnostics = false,
                    git = false,
                    profile = false,
                    watcher = false,
                },
            },
        }
    end
}
