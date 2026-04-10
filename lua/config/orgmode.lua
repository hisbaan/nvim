return {
    'nvim-orgmode/orgmode',
    ft = { 'org' },
    config = function()
        require('orgmode').setup({
            org_agenda_files = { '~/Documents/org/*' },
            org_default_notes_file = '~/Documents/org/refile.org',
            mappings = {
                org = {
                    org_meta_return = { '<Leader><CR>', '<C-CR>' },
                    org_return = {}
                }
            },
            emacs_config = {
                executable_path = 'emacs',
                config_path = '$HOME/.config/emacs/early-init.el',
            }
        })
    end
}
