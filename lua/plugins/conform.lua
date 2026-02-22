return {
	"conform.nvim",
	-- Load only when you are about to save a file
	event = { "BufWritePre" },
	after = function()
		local conform = require("conform")

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
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})

		-- Force format on the very first save that triggered the plugin load
		conform.format({
			bufnr = vim.api.nvim_get_current_buf(),
			timeout_ms = 500,
			lsp_fallback = true,
		})
	end,
}
