vim.o.linebreak = true
vim.o.hidden = true
vim.o.history = 5000
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
vim.o.encoding = "utf-8"
vim.g.tex_flavor = "latex"
vim.o.undofile = true
vim.o.timeoutlen = 400 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.ttimeout = true
vim.o.ttimeoutlen = 0  -- Time in milliseconds to wait for a key code sequence to complete
vim.o.conceallevel = vim.bo.readonly or vim.bo.buftype == 'nofile' and 2 or 0
vim.o.concealcursor = "nc"
vim.o.virtualedit = "all"
if vim.fn.executable("rg") then
  vim.o.grepprg = "rg --vimgrep --no-heading --smart-case --"
end
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" } -- A comma separated list of options for Insert mode completion
vim.o.wildignorecase = true                                       -- When set case is ignored when completing file names and directories
vim.o.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]]

-- Spelling
vim.o.spelllang = 'en_ca'

-- Tabs & Indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.textwidth = 0
vim.o.joinspaces = false
vim.o.expandtab = true   -- convert tabs to spaces
vim.o.smartindent = true -- make indenting smarter again
vim.o.breakindent = true -- indent wrapped lines
vim.o.breakindentopt = "list:-1"

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

-- Appearance
vim.o.cursorline = true
vim.wo.rnu = true
vim.wo.number = true
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5
vim.o.termguicolors = true
vim.o.cmdheight = 1     -- space for displaying messages/commands
vim.o.showmode = false  -- we don't need to see things like -- INSERT -- anymore
vim.o.splitbelow = true -- force all horizontal splits to go below current window
vim.o.splitright = true -- force all vertical splits to go to the right of current window
vim.o.hlsearch = true   -- highlight all matches on previous search pattern
vim.o.lazyredraw = true -- do not redraw screen while running macros
