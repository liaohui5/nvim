return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    notifier = {
      enabled = false,
    },
    terminal = {
      win = {
        -- default position is bottom, like vscode terminal
        position = "float",
      },
    },
  },
}
