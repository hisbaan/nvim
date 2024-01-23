return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    enabled = false,
    opts = {
        theme = 'doom',
        config = {
            header = {
                [[                  __]],
                [[ ___     ___    ___   __  __ /\_\    ___ ___]],
                [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
                [[ /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
                [[  \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                [[   \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            },
            center = {
                {
                    icon = '',
                    -- icon_hl = 'group',
                    desc = 'Find File',
                    desc_hl = 'group',
                    key = 'SPC SPC',
                    key_hl = 'group',
                    key_format = ' [%s]', -- `%s` will be substituted with value of `key`
                    action = '<leader><leader>',
                },
            },
            footer = {},
            packages = {
                enable = false,
            },
        }
    },
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
