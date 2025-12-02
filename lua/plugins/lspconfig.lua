return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  opts = {
    inlay_hints = {
      enabled = false, -- disabled inlay_hints
    },
    servers = {
      ["*"] = {
        keys = {
          { "<c-k>", false }, -- disable default lsp server keymap
        },
      },
      emmet_language_server = {
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#emmet_language_server
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
      biome = {
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#biome
        filetypes = {
          "astro",
          "css",
          "graphql",
          "html",
          "javascript",
          "javascriptreact",
          "json",
          "jsonc",
          "svelte",
          "typescript",
          "typescript.tsx",
          "typescriptreact",
        },
      },
    },
  },
}
