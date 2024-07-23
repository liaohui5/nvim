return {
  "folke/which-key.nvim",
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
  },
}
