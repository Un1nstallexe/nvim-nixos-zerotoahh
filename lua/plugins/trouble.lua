return {
	"trouble.nvim",
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
	},
	-- `after` runs exactly once, right after the plugin is added to the runtimepath
	after = function()
		local trouble = require("trouble")
		trouble.setup({})
		vim.keymap.set("n", "]q", function()
			trouble.next({ skip_groups = true, jump = true })
		end, { desc = "Next Trouble Item" })

		-- Jump to the previous item in the trouble list
		vim.keymap.set("n", "[q", function()
			trouble.prev({ skip_groups = true, jump = true })
		end, { desc = "Previous Trouble Item" })
	end,
}
