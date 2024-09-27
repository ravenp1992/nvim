local opt = vim.opt

-- folding
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- turn on termguicolors
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- opt.cursorline = true

opt.scrolloff = 8

-- no swap file, no backup, undofile, set undodir
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split window
opt.splitright = true
opt.splitbelow = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- vim.api.nvim_create_autocmd("RecordingEnter", {
-- 	pattern = "*",
-- 	callback = function()
-- 		opt.cmdheight = 1
-- 	end,
-- })

-- vim.api.nvim_create_autocmd("RecordingLeave", {
-- 	pattern = "*",
-- 	callback = function()
-- 		opt.cmdheight = 0
-- 	end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "*.php",
-- 	callback = function()
-- 		vim.opt.filetype = "php.html"
-- 	end,
-- })

-- autocmd filetype php set filetype=php.html
