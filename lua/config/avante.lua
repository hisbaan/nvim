local opts = require('opts');

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  enabled = true,
  version = false,
  build = "make",
  keys = {
    { "<leader>a+", function() require("avante.extensions.nvim_tree").add_file() end,    opts, desc = "Select file in NvimTree", ft = "NvimTree" },
    { "<leader>a-", function() require("avante.extensions.nvim_tree").remove_file() end, opts, desc = "Remove file in NvimTree", ft = "NvimTree" },
  },
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
    mappings = {
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      cancel = {
        normal = { "<C-c>", "<Esc>", "q" },
        insert = { "<C-c>" },
      },
      ask = "<leader>aa",
      edit = "<leader>ae",
      refresh = "<leader>ar",
      focus = "<leader>af",
      stop = "<leader>aS",
      toggle = {
        default = "<leader>at",
        debug = "<leader>ad",
        hint = "<leader>ah",
        suggestion = "<leader>as",
        repomap = "<leader>aR",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        retry_user_request = "r",
        edit_user_request = "e",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
        remove_file = "d",
        add_file = "@",
        close = { "q" },
        close_from_input = nil,
      },
      files = {
        add_current = "<leader>ac",
        add_all_buffers = "<leader>aB",
      },
      select_model = "<leader>am",
      select_history = "<leader>ah",
    },
  },
}
