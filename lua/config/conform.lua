return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<Leader>lf",
			function()
				require("conform").format({ async = true })
			end,
		},
	},
	config = function()
		local conform = require("conform")

		-- TODO flags.lua support
		local oxfmt = { "oxfmt" }
		local ts_adjacent = { "biome", "oxfmt", "prettier", "prettierd", stop_after_first = true }

		conform.setup({
			formatters = {
				-- TODO read buffer, write to buffer instead of formatting the file, maybe some variant of :%!
				topiary = {
					inherit = false,
					command = "topiary",
					args = { "format", "$FILENAME" },
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				yaml = { "yamlfmt" },
				markdown = oxfmt,
				javascript = ts_adjacent,
				javascriptreact = ts_adjacent,
				typescript = ts_adjacent,
				typescriptreact = ts_adjacent,
				json = ts_adjacent,
				html = ts_adjacent,
				openscad = { "topiary" },
				go = { "goimports", "gofmt" },
			},
		})
	end,
}
