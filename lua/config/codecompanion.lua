return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		opts = {
			log_level = "DEBUG",
		},
		strategies = {
			chat = {
				adapter = {
					name = "gemini",
					model = "gemini-3-pro-preview",
				},
			},
			inline = {
				adapter = {
					name = "gemini",
					model = "gemini-3-pro-preview",
				},
			},
			cmd = {
				adapter = {
					name = "gemini",
					model = "gemini-3-pro-preview",
				},
			},
		},
	},
}
