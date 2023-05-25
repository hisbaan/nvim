return {
    'iamcco/markdown-preview.nvim',
    build = function()
        vim.fn['mkdp#util#install']()
    end,
    ft = { 'markdown' },
    config = function()
        local g = vim.g
        g.mkdp_browser = "firefox"
    end
}
