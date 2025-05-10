return {
	'L3MON4D3/LuaSnip',
	dependencies = { 'rafamadriz/friendly-snippets' },
	lazy = false,
	config = function()
		-- Shorthands
		---@diagnostic disable: unused-local
		local luasnip = require("luasnip")
		-- some shorthands...
		local s = luasnip.snippet
		local sn = luasnip.snippet_node
		local t = luasnip.text_node
		local i = luasnip.insert_node
		local f = luasnip.function_node
		local c = luasnip.choice_node
		local d = luasnip.dynamic_node
		local r = luasnip.restore_node
		local l = require("luasnip.extras").lambda
		local rep = require("luasnip.extras").rep
		local p = require("luasnip.extras").partial
		local m = require("luasnip.extras").match
		local n = require("luasnip.extras").nonempty
		local dl = require("luasnip.extras").dynamic_lambda
		local fmt = require("luasnip.extras.fmt").fmt
		local fmta = require("luasnip.extras.fmt").fmta
		local types = require("luasnip.util.types")
		local conds = require("luasnip.extras.expand_conditions")
		---@diagnostic enable: unused-local

		vim.api.nvim_create_autocmd("ModeChanged", {
			callback = function (event)
			---@diagnostic disable-next-line: undefined-field
			if ((event.old_mode == 's' and event.new_mode == 'n') or event.old_mode == 'i')
					and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
					and not require('luasnip').session.jump_active
			then
				require('luasnip').unlink_current()
			end
			end
		})

		require('luasnip').setup({})

		luasnip.config.setup({
			history = false,
			update_events = "TextChanged,TextChangedI",
			delete_check_events = "TextChanged",
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { "choiceNode", "Comment" } },
					}
				}
			},
			ext_base_prio = 300,
			ext_prio_increase = 1,
			enable_autosnippets = true,
			store_selection_keys = "<Tab>",
			ft_func = function()
				return vim.split(vim.bo.filetype, ".")
			end,
		})

		--------------
		-- Snippets --
		--------------

		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets/" } })

		-- uuidgen
		local function uuid()
			local id, _ = vim.fn.system('uuidgen'):gsub('\n', '')
			return id
		end
		luasnip.add_snippets('global', {
			s({
				trig = 'uuid',
				name = 'UUID',
				dscr = 'Generate a unique UUID'
			}, {
				d(1, function() return sn(nil, i(1, uuid())) end)
			})
		})
	end
}
