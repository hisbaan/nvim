return {
	"romus204/tree-sitter-manager.nvim",
	init = function()
		vim.treesitter.language.register("tsx", "typescriptreact")
		vim.treesitter.language.register("jsx", "javascriptreact")
		vim.treesitter.language.register("json", "jsonc")

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "typescriptreact",
			callback = function(args) pcall(vim.treesitter.start, args.buf, "tsx") end,
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "javascriptreact",
			callback = function(args) pcall(vim.treesitter.start, args.buf, "jsx") end,
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "jsonc",
			callback = function(args) pcall(vim.treesitter.start, args.buf, "json") end,
		})
	end,
	dependencies = {}, -- tree-sitter CLI must be installed system-wide
	opts = {
		nohighlight = { "csv" },
	},
}
