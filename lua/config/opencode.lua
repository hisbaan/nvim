return {
	"NickvanDyke/opencode.nvim",
	dependencies = {
		---@module 'snacks'
		{ "folke/snacks.nvim" },
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- see `lua/opencode/config.lua`
		}

		vim.o.autoread = true

		vim.keymap.set({ "n", "x" }, "<leader>oa", function()
			require("opencode").ask("@this: ", { submit = true })
		end, { desc = "Ask opencode" })

		vim.keymap.set({ "n", "x" }, "<leader>oo", function()
			require("opencode").select()
		end, { desc = "Execute opencode action…" })

		vim.keymap.set({ "n", "x" }, "<leader>o+", function()
			require("opencode").prompt("@this")
		end, { desc = "Add to opencode" })

		vim.keymap.set({ "n", "t" }, "<leader>ot", function()
			require("opencode").toggle()
		end, { desc = "Toggle opencode" })
	end,
}
