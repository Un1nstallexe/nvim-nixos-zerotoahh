return {
	"mini.pairs",
	-- `after` runs exactly once, right after the plugin is added to the runtimepath
	after = function()
		local pairs = require("mini.pairs")
		pairs.setup({})
	end,
}
