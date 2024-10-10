return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
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
      -- disabled icon
      mappings = false,
    },
  },
}
