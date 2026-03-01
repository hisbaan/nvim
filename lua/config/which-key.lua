local opts = require("opts")

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
      opts,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
