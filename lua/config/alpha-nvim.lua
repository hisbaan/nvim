return {
    'goolord/alpha-nvim',
    enabled = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('alpha').setup(require('alpha.themes.dashboard').opts)
    end
}
