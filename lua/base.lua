
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 250

opt.clipboard = "unnamedplus"


opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true


opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true


vim.g.mapleader = " "
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
