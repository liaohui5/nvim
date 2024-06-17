return {
  "folke/which-key.nvim",
  opts = {
    ignore_missing = false,
    show_help = true,
    triggers = "auto",
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
