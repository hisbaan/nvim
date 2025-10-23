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
		-- TODO flags.lua support
		local typescriptFormatters = { "prettier", stop_after_first = true }
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				yaml = { "yamlfmt" },
				javascript = typescriptFormatters,
				javascriptreact = typescriptFormatters,
				typescript = typescriptFormatters,
				typescriptreact = typescriptFormatters,
			},
		})
	end,
}
