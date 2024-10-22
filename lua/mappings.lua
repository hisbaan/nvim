local map = vim.api.nvim_set_keymap
local opts = require('opts')
local expr_options = { noremap = true, expr = true, silent = true }

-- better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- center search results
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

-- deal with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_options)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_options)

-- better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- paste over currently selected text without yanking it
map("v", "p", "\"_dP", opts)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)

-- Resizing panes
map("n", "<C-Left>", ":vertical resize +1<CR>", opts)
map("n", "<C-Right>", ":vertical resize -1<CR>", opts)
map("n", "<C-Up>", ":resize -1<CR>", opts)
map("n", "<C-Down>", ":resize +1<CR>", opts)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)

-- Remove conflicting keybinds
vim.cmd([[map <C-f> <Nop>]])

-- Smart dd
local function smart_dd()
    if vim.api.nvim_get_current_line():match("^%s*$") then
        return '"_dd'
    else
        return "dd"
    end
end
vim.keymap.set("n", "dd", smart_dd, expr_options)

-- Ctrl + backspace
vim.cmd([[
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
]])

-- Save on leader w
map('n', '<Leader>w', "<Cmd>w<CR>", opts)

-- quickfix bindinds
map("n", "<Leader>qn", "<Cmd>cnext<CR>zz", opts)
map("n", "<Leader>qp", "<Cmd>cprev<CR>zz", opts)
map("n", "<Leader>qf", "<Cmd>cnfile<CR>zz", opts)

-- Terminal
map('n', '<Leader>tt', '<Cmd>terminal<CR>A', opts)

-- lsp
map('n', '<Leader>la', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<Leader>lf', '<Cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
map('n', '<Leader>lr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)

local virtual_lines_enabled = false
map('n', '<leader>lt', '', {
    callback = function()
        virtual_lines_enabled = not virtual_lines_enabled
        vim.diagnostic.config({
            virtual_lines = virtual_lines_enabled,
            virtual_text = not virtual_lines_enabled,
        })
    end,
})
