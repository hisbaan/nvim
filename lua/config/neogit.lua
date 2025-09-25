local opts = require('opts')

return {
    'NeogitOrg/neogit',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = {
        { '<Leader>gg', '<Cmd>Neogit<CR>', opts, desc = "Neogit" }
    },
    opts = {
        -- Hides the hints at the top of the status buffer
        disable_hint = false,
        -- Disables changing the buffer highlights based on where the cursor is.
        disable_context_highlighting = false,
        -- Disables signs for sections/items/hunks
        disable_signs = false,
        -- Do not ask to confirm the commit - just do it when the buffer is closed.
        disable_commit_confirmation = false,
        -- Changes what mode the Commit Editor starts in. `true` will leave nvim in normal mode, `false` will change nvim to
        -- insert mode, and `"auto"` will change nvim to insert mode IF the commit message is empty, otherwise leaving it in
        -- normal mode.
        disable_insert_on_commit = true,
        -- When enabled, will watch the `.git/` directory for changes and refresh the status buffer in response to filesystem
        -- events.
        filewatcher = {
            interval = 1000,
            enabled = true,
        },
        -- "ascii"   is the graph the git CLI generates
        -- "unicode" is the graph like https://github.com/rbong/vim-flog
        graph_style = "ascii",
        -- Allows a different telescope sorter. Defaults to 'fuzzy_with_index_bias'. The example below will use the native fzf
        -- sorter instead. By default, this function returns `nil`.
        -- telescope_sorter = function()
        --     return require("telescope").extensions.fzf.native_fzf_sorter()
        -- end,
        -- Persist the values of switches/options within and across sessions
        remember_settings = true,
        -- Scope persisted settings on a per-project basis
        use_per_project_settings = true,
        -- Table of settings to never persist. Uses format "Filetype--cli-value"
        ignored_settings = {
            "NeogitPushPopup--force-with-lease",
            "NeogitPushPopup--force",
            "NeogitPullPopup--rebase",
            "NeogitCommitPopup--allow-empty",
            "NeogitRevertPopup--no-edit",
        },
        -- Set to false if you want to be responsible for creating _ALL_ keymappings
        use_default_keymaps = true,
        -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
        -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
        auto_refresh = true,
        -- Value used for `--sort` option for `git branch` command
        -- By default, branches will be sorted by commit date descending
        -- Flag description: https://git-scm.com/docs/git-branch#Documentation/git-branch.txt---sortltkeygt
        -- Sorting keys: https://git-scm.com/docs/git-for-each-ref#_options
        sort_branches = "-committerdate",
        -- Change the default way of opening neogit
        kind = "tab",
        -- Disable line numbers and relative line numbers
        disable_line_numbers = true,
        -- The time after which an output console is shown for slow running commands
        console_timeout = 2000,
        -- Automatically show console if a command takes more than console_timeout milliseconds
        auto_show_console = true,
        status = {
            recent_commit_count = 10,
        },
        commit_editor = {
            kind = "split",
        },
        commit_select_view = {
            kind = "tab",
        },
        commit_view = {
            kind = "split",
            verify_commit = os.execute("which gpg") == 0,     -- Can be set to true or false, otherwise we try to find the binary
        },
        log_view = {
            kind = "tab",
        },
        rebase_editor = {
            kind = "split",
        },
        reflog_view = {
            kind = "tab",
        },
        merge_editor = {
            kind = "split",
        },
        tag_editor = {
            kind = "split",
        },
        preview_buffer = {
            kind = "split",
        },
        popup = {
            kind = "split",
        },
        signs = {
            -- { CLOSED, OPENED }
            section = { "", "" },
            item = { "", "" },
            hunk = { "", "" },
        },
        -- Each Integration is auto-detected through plugin presence, however, it can be disabled by setting to `false`
        integrations = {
            telescope = false,
            diffview = false,
        },
    }
}
