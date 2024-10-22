local opts = require("opts")

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  enabled = true,
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", },
  keys = {
    { "<Leader>hh", function() require("harpoon"):list():add() end,                                    opts },
    { "<Leader>hm", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, opts },
    { "<Leader>ha", function() require("harpoon"):list():select(1) end,                                opts },
    { "<Leader>hs", function() require("harpoon"):list():select(2) end,                                opts },
    { "<Leader>hd", function() require("harpoon"):list():select(3) end,                                opts },
    { "<Leader>hf", function() require("harpoon"):list():select(4) end,                                opts },
    { "<Leader>hn", function() require("harpoon"):list():next() end,                                   opts },
    { "<Leader>hp", function() require("harpoon"):list():prev() end,                                   opts },
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
      { desc = "Open harpoon window" })
  end
}
