return {
	"mini.comment",
	-- `after` runs exactly once, right after the plugin is added to the runtimepath
	after = function()
		local comment = require("mini.comment")
		comment.setup({})
	end,
}
