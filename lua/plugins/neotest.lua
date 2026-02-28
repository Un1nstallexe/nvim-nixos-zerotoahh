return {
	"neotest",
	after = function()
		require("neotest").setup({
			adapters = {
				require("neotest-dotnet"),
				require("neotest-playwright").adapter({
					options = {
						persist_project_selection = true,
						enable_dynamic_test_discovery = true,
					},
				}),
			},
		})
	end,
}
