local opt = vim.opt

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

opt.cursorline = true

opt.scrolloff = 8

-- no swap file, no backup, undofile, set undodir
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split window
opt.splitright = true
opt.splitbelow = true

vim.cmd([[autocmd BufEnter * set formatoptions-=cro]])
vim.cmd([[autocmd BufEnter * setlocal formatoptions-=cro]])
