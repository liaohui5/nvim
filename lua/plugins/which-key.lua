return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    show_help = true,
    plugins = {
      spelling = { enabled = false },
    },
    layout = {
      spacing = 4,
      align = "center",
    },
    disable = {
      filetypes = {
        "TelescopePrompt",
        "NvimTree",
        "neo-tree",
      },
    },
    icons = {
      mappings = vim.g.whichkey_icon_enabeld
    }
  },
}
