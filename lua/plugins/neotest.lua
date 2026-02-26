return {
	"neotest",
	before = function()
		require("lz.n").trigger_load("neotest-dotnet")
		require("lz.n").trigger_load("neotest-playwright")
		require("lz.n").trigger_load("nvim-nio")
		require("lz.n").trigger_load("plenary.nvim")
	end,
	after = function()
		require("neotest").setup({
			adapters = {
				require("neotest-dotnet"),
				require("neotest-playwright"),
			},
		})
	end,
}
