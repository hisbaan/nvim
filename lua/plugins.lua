-- set leader (needs to be done before lazy loads)
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    plugins = {
        install = {
            colorscheme = { "catppuccin-mocha" }
        }
    },
    ui = {
        border = "rounded",
        backdrop = false,
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
}
require('lazy').setup("config", opts)
