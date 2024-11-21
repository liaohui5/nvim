-- https://www.lazyvim.org/extras/lang/markdown
return {
  {
    "stevearc/conform.nvim",
    optional = true,
  },
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = {} },
  },
  {
    "nvimtools/none-ls.nvim",
    optional = false,
  },
  {
    "mfussenegger/nvim-lint",
    optional = false,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       marksman = {},
  --     },
  --   },
  -- },
}
