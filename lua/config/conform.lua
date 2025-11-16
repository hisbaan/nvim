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
		local typescriptFormatters = { "prettier", stop_after_first = true }

		conform.setup({
			formatters = {
				-- TODO read buffer, write to buffer instead of formatting the file
				topiary = {
					inherit = false,
					command = "topiary",
					args = { "format", "$FILENAME" },
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				yaml = { "yamlfmt" },
				markdown = typescriptFormatters,
				javascript = typescriptFormatters,
				javascriptreact = typescriptFormatters,
				typescript = typescriptFormatters,
				typescriptreact = typescriptFormatters,
				openscad = { "topiary" },
			},
		})
	end,
}
