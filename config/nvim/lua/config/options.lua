-- ~/.config/nvim/lua/config/options.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- UI and Performance
opt.guicursor = ""            -- Block cursor everywhere
opt.scrolloff = 8             -- Keep 8 lines above/below cursor (crucial for context!)
opt.updatetime = 50           -- Faster completion and UI updates
opt.termguicolors = true      -- 24-bit RGB colors
opt.signcolumn = "yes"        -- Always show signcolumn

-- Line Numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true          -- Use spaces instead of tabs
opt.smartindent = true
opt.autoindent = true

-- Search
opt.hlsearch = false          -- Don't keep search results highlighted forever
opt.incsearch = true          -- Highlight as you type
opt.ignorecase = true
opt.smartcase = true

-- Files, Backup, and Undo
opt.encoding = "utf-8"
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undofile = true           -- Persistent undo
-- Store undo history in the modern Neovim data path
opt.undodir = vim.fn.stdpath("data") .. "/undodir"

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Netrw Configuration
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 25
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
