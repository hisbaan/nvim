return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { "Avante" },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  },
  opts = {
    file_types = { "Avante" },
    sign = {
      enabled = false,
    },
  }
}
