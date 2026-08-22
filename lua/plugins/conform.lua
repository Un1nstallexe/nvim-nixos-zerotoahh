return {
	"conform.nvim",
	-- Load only when you are about to save a file
	event = { "BufEnter" },
	keys = {
		{
			"<leader>taf",
			function()
				if vim.g.disable_autoformat == nil then
					vim.g.disable_autoformat = false
				end
				vim.g.disable_autoformat = not vim.g.disable_autoformat
				if vim.g.disable_autoformat == true then
					vim.notify("Formatting on save is disabled.")
				else
					vim.notify("Formatting on save is enabled")
				end
			end,
			desc = "Toggle auto format",
		},
	},
	after = function()
		local conform = require("conform")
		local format_if_allowed = function(bufnr)
			if vim.g.disable_autoformat then
				vim.notify("Skipping formatting: formatting on save is disabled.")
				return nil
			end

			return { timeout_ms = 500, lsp_format = "fallback", bufnr = bufnr }
		end

		conform.setup({
			formatters_by_ft = {
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				python = { "ruff" },
				nix = { "nixfmt" },
				rust = { "rustfmt" },
				cs = { "csharpier" },
				kt = { "ktfmt" },
			},
			format_on_save = format_if_allowed,
		})
	end,
}
