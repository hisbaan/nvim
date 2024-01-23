return {
    'goolord/alpha-nvim',
    enabled = true,
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
        require('alpha').setup(require('alpha.themes.dashboard').opts)
    end
}
