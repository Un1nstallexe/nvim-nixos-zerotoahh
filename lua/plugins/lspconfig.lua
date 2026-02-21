return {
  "nvim-lspconfig",
  -- Load as soon as you open a real file
  event = { "BufReadPre", "BufNewFile" },
  before = function()
    -- Manually tell lz.n to load blink.cmp before lspconfig starts its 'load' or 'after'
    require("lz.n").trigger_load("blink.cmp")
  end,
  after = function()
    -- Inject blink.cmp capabilities into your LSPs so they know autocomplete is available
    -- Note: Because lspconfig loads on BufReadPre, requiring blink here will trigger
    -- blink's load slightly earlier than InsertEnter. This is standard and totally fine
    -- since blink is incredibly fast.
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local servers = { "html", "cssls", "ts_ls" }

    for _, server in ipairs(servers) do
      if server == "omnisharp" then
        vim.lsp.config(server, {
          capabilities = capabilities,
          on_attach = on_attach,
          cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
          root_markers = { '.git' }
        })
      else
        local opts = {
          capabilities = capabilities,
          on_attach = on_attach,
          root_markers = { '.git', 'angular.json' }
        }

        vim.lsp.config(server, opts)
      end
    end

    -- Core LSP Keybinds
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
  end,
}
