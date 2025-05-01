local opts = require('opts');

return {
  "olimorris/persisted.nvim",
  event = "BufReadPre",
  lazy = false,
  keys = {
    { '<leader>ss', '<Cmd>SessionSelect<CR>',  opts, desc = "Search Sessions" },
    { '<leader>sd', '<Cmd>SessionDelete<CR>',  opts, desc = "Delete Session" },
    { '<leader>sr', '<Cmd>SessionRestore<CR>', opts, desc = "Restore Session" },
    { '<leader>sl', '<Cmd>SessionLoad<CR>',    opts, desc = "Restore Session" },
    { '<leader>sS', '<Cmd>SessionSave<CR>',    opts, desc = "Save Session" },
  },
  opts = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

    return {
      autostart = true,
      autoload = true,
      follow_cwd = true,
      use_git_branch = true,
      ignored_dirs = {
        { "/",           exact = true },
        { "~/",          exact = true },
        { "~/Downloads", exact = true },
        "~/.config/nvim",
        "~/Documents/obsidian",
      }
    }
  end,
}
