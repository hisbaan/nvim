local opts = require("opts")

-- map('v', '<leader>hs', function()
--     gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
--   end)
--
--   map('v', '<leader>hr', function()
--     gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
--   end)

return {
	"lewis6991/gitsigns.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>gn",
			function()
				require("gitsigns").nav_hunk("next")
			end,
			opts,
			desc = "next hunk",
		},
		{
			"<leader>gp",
			function()
				require("gitsigns").nav_hunk("prev")
			end,
			opts,
			desc = "prev hunk",
		},
		{
			"<leader>gs",
			mode = { "v" },
			function()
				require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
			desc = "stage selection"
		},
		-- TODO look for a "unstage hunk"
		-- {
		-- 	"<leader>gr",
		-- 	mode = { "v" },
		-- 	function()
		-- 		require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		-- 	end,
		-- 	desc = "reset selection"
		-- },
		{
			"<leader>gs",
			function()
				require("gitsigns").stage_hunk()
			end,
			opts,
			desc = "stage hunk",
		},
		-- TODO look for a "unstage hunk"
		-- {
		-- 	"<leader>gr",
		-- 	function()
		-- 		require("gitsigns").reset_hunk()
		-- 	end,
		-- 	opts,
		-- 	desc = "reset hunk",
		-- },
	},
	lazy = false,
	opts = {
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
		},
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000,
		preview_config = {
			-- Options passed to nvim_open_win
			border = "single",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
		diff_opts = { internal = true },
	},
	-- config = function(_, o)
	-- 	require("gitsigns").setup(o)
	-- end,
}
