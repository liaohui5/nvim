return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  opts = {
    -- https://www.lazyvim.org/plugins/lsp#nvim-lspconfig
    inlay_hints = {
      enabled = false,
    },
    diagnostics = {
      virtual_text = false,
    },
    servers = {
      ["*"] = {
        -- disabled <ctrl-k> keymaps
        keys = {
          { "<c-k>", false },
        },
      }
    }
  },
}
