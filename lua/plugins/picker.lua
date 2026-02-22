return {
	"mini.pick",
	-- `after` runs exactly once, right after the plugin is added to the runtimepath
	after = function()
		local picker = require("mini.pick")
		picker.setup({})
	end,
}
