return {
	"neotest",
	after = function()
		require("neotest").setup({
			adapters = {
				require("neotest-dotnet"),
				require("neotest-playwright"),
			},
		})
	end,
}
