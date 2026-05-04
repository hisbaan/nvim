return {
	"romus204/tree-sitter-manager.nvim",
	init = function()
		-- table mapping from parser -> filetype for overrides
		local mappings = {
			tsx = "typescriptreact",
			jsx = "javascriptreact",
			json = "jsonc",
			gotmpl = "template",
		}

		for parser, ft in pairs(mappings) do
			vim.treesitter.language.register(parser, ft)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = ft,
				callback = function(args)
					pcall(vim.treesitter.start, args.buf, parser)
				end,
			})
		end
	end,
	dependencies = {}, -- tree-sitter CLI must be installed system-wide
	opts = {
		nohighlight = { "csv" },
	},
}
