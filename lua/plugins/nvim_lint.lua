return {
	"nvim-lint",
	-- Load as soon as you open a real file
	event = { "BufReadPre", "BufNewFile" },
	after = function()
		-- Inject blink.cmp capabilities into your LSPs so they know autocomplete is available
		-- Note: Because lspconfig loads on BufReadPre, requiring blink here will trigger
		-- blink's load slightly earlier than InsertEnter. This is standard and totally fine
		-- since blink is incredibly fast.
		require("lint").linters_by_ft = {
			rust = { "clippy" },
		}
	end,
}
