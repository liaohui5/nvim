return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
  },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    table.insert(keys, {
      "<leader>rn",
      "<leader>cr",
      desc = "Rename Symbol",
      mode = { "n", "v" },
      remap = true,
      silent = true,
    })
  end,
}
