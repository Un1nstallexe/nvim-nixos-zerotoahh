return {
	"blink.cmp",
	-- Load when entering Insert Mode or Command Mode
	event = { "InsertEnter", "CmdlineEnter" },
	after = function()
		require("blink.cmp").setup({
			keymap = { preset = "enter" },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			completion = {
				menu = {
					draw = {
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			-- Optional: adjust signature help if you want it to pop up as you type
			signature = { enabled = true },
		})
	end,
}
