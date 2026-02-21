return {
  "blink.cmp",
  -- Load when entering Insert Mode or Command Mode
  event = { "InsertEnter", "CmdlineEnter" },
  after = function()
    require("blink.cmp").setup({
      keymap = { preset = "default" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono"
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      -- Optional: adjust signature help if you want it to pop up as you type
      signature = { enabled = true }
    })
  end,
}
