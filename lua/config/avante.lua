return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  enabled = true,
  version = false,
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    'MeanderingProgrammer/render-markdown.nvim',
  },
  opts = {
    provider = "gemini_pro",
    vendors = {
      gemini_pro = {
        -- see https://ai.google.dev/gemini-api/docs/models/gemini
        __inherited_from = 'gemini',
        api_key_name = 'GEMINI_API_KEY',
        endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
        model = "gemini-2.5-pro-exp-03-25",
        timeout = 30000, -- ms
        temperature = 0,
        max_tokens = 16384,
      },
      gemini_flash = {
        -- see https://ai.google.dev/gemini-api/docs/models/gemini
        __inherited_from = 'gemini',
        api_key_name = 'GEMINI_API_KEY',
        endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
        model = "gemini-2.5-flash-preview-04-17",
        timeout = 30000, -- ms
        temperature = 0,
        max_tokens = 16384,
      },
    },
    hints = { enabled = false },
    behaviour = {
      auto_suggestions = false, -- experimental
      auto_set_keymaps = true,  -- TODO look into setting keymaps manually
      use_cwd_as_project_root = true,
    },
  },
}
