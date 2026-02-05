local opts = require("opts")

return {
	"olimorris/persisted.nvim",
	event = "BufReadPre",
	lazy = false,
	keys = {
		{ "<leader>sS", "<Cmd>Persisted select<CR>", opts, desc = "Select Session" },
		{ "<leader>sd", "<Cmd>Persisted delete_current<CR>", opts, desc = "Delete Current Session" },
		{ "<leader>sD", "<Cmd>Persisted delete<CR>", opts, desc = "Delete Session" },
		{ "<leader>sl", "<Cmd>Persisted load<CR>", opts, desc = "Restore Session" },
		{ "<leader>ss", "<Cmd>Persisted save<CR>", opts, desc = "Save Session" },
	},
	opts = function()
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

		return {
			autostart = true,
			autoload = true,
			follow_cwd = true,
			use_git_branch = true,
			ignored_dirs = {
				{ "/", exact = true },
				{ "~/", exact = true },
				{ "~/Downloads", exact = true },
				"~/.config/nvim",
				"~/Documents/obsidian",
			},
		}
	end,
}
