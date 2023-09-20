local opts = require('opts')

return {
    'NeogitOrg/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
        { '<Leader>gg', '<Cmd>Neogit<CR>', opts, desc = "Neogit" }
    },
    config = function()
        local neogit = require("neogit")

        neogit.setup {
            disable_signs = false,
            disable_hint = false,
            disable_context_highlighting = false,
            disable_commit_confirmation = false,
            -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
            -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
            auto_refresh = true,
            -- Value used for `--sort` option for `git branch` command
            -- By default, branches will be sorted by commit date descending
            -- Flag description: https://git-scm.com/docs/git-branch#Documentation/git-branch.txt---sortltkeygt
            -- Sorting keys: https://git-scm.com/docs/git-for-each-ref#_options
            sort_branches = "-committerdate",
            disable_builtin_notifications = false,
            -- Allows a different telescope sorter. Defaults to 'fuzzy_with_index_bias'. The example
            -- below will use the native fzf sorter instead.
            telescope_sorter = function()
                return require("telescope").extensions.fzf.native_fzf_sorter()
            end,
            use_magit_keybindings = false,
            -- Change the default way of opening neogit
            kind = "tab",
            -- The time after which an output console is shown for slow running commands
            console_timeout = 2000,
            -- Automatically show console if a command takes more than console_timeout milliseconds
            auto_show_console = true,
            -- Persist the values of switches/options within and across sessions
            remember_settings = true,
            -- Scope persisted settings on a per-project basis
            use_per_project_settings = true,
            -- Array-like table of settings to never persist. Uses format "Filetype--cli-value"
            --   ie: `{ "NeogitCommitPopup--author", "NeogitCommitPopup--no-verify" }`
            ignored_settings = {},
            -- Change the default way of opening the commit popup
            commit_popup = {
                kind = "split",
            },
            -- Change the default way of opening the preview buffer
            preview_buffer = {
                kind = "split",
            },
            -- Change the default way of opening popups
            popup = {
                kind = "split",
            },
            -- customize displayed signs
            signs = {
                -- { CLOSED, OPENED }
                section = { "", "" },
                item = { "", "" },
                hunk = { "", "" },
            },
            -- Integrations are auto-detected, and enabled if available, but can be disabled by setting to "false"
            integrations = {
                telescope = true,
                diffview = true,
            },
            -- Setting any section to `false` will make the section not render at all
            sections = {
                -- Reverting/Cherry Picking
                sequencer = {
                    folded = false,
                    hidden = false,
                },
                untracked = {
                    folded = false,
                    hidden = false,
                },
                unstaged = {
                    folded = false,
                    hidden = false,
                },
                staged = {
                    folded = false,
                    hidden = false,
                },
                stashes = {
                    folded = true,
                    hidden = false,
                },
                unpulled_upstream = {
                    folded = true,
                    hidden = false,
                },
                unmerged_upstream = {
                    folded = false,
                    hidden = false,
                },
                unpulled_pushRemote = {
                    folded = true,
                    hidden = false,
                },
                unmerged_pushRemote = {
                    folded = false,
                    hidden = false,
                },
                recent = {
                    folded = true,
                    hidden = false,
                },
                rebase = {
                    folded = true,
                    hidden = false,
                },
            },
        }
    end
}

