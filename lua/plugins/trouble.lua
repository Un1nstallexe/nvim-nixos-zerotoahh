return {
  "trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
  },
  -- `after` runs exactly once, right after the plugin is added to the runtimepath
  after = function()
    require("trouble").setup({})
  end,
}
