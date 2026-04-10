return {
	"olimorris/codecompanion.nvim",
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
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
