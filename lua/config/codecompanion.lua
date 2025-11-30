return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			opts = {
				log_level = "DEBUG",
			},
			strategies = {
				chat = {
					adapter = {
						name = "gemini",
						model = "gemini-2.5-pro",
						-- model = "gemini-3-pro-preview",
					},
				},
				inline = {
					adapter = "copilot",
				},
				cmd = {
					adapter = {
						name = "gemini",
						model = "gemini-2.5-pro",
						-- model = "gemini-3-pro-preview",
					},
				},
			},
		})
	end,
}
