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
vim.keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>")

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		local groups = { "Normal", "NormalNC", "LineNr", "SignColumn", "EndOfBuffer" }
		for _, group in ipairs(groups) do
			vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
		end
	end,
})
vim.cmd.colorscheme("oxocarbon")
vim.opt.background = "dark"

require("plugin_loader")
require("sync_plugins_setup")
