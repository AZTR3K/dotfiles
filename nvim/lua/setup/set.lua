-- Vim setup

-- Set leader key
vim.g.mapleader = " "

-- Set to block cursor
vim.opt.guicursor = ""

-- Set file encoding and theme color support
vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true

-- Set tab space and indent logic
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Set wrap and swap files
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Set search behavior
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Set normal and relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Set UI improvements and performance
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

-- Set Netrw behavior
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
