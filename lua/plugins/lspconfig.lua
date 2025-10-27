return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          { "<c-k>", false }, -- disable default lsp server keymap
        },
      },
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
  },
}
