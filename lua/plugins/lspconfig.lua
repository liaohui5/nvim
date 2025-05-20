return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  opts = function(_, opts)
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    -- disabled default keymaps ctrl+k
    table.insert(keys, { "<c-k>", false })

    return vim.tbl_deep_extend("force", opts, {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        emmet_language_server = {
          -- better html and css support
          filetypes = {
            "html",
            "css",
            "less",
            "sass",
            "scss",
            "pug",
            "vue",
            "javascriptreact",
            "typescriptreact",
          },
        },
      },
    })
  end,
}
