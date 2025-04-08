return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    animate = {
      enabled = false,
    },
    debug = {
      enabled = false,
    },
    dim = {
      enabled = false,
    },
    notifier = {
      enabled = false,
    },
    profiler = {
      enabled = false,
    },
    scratch = {
      enabled = false,
    },
    scroll = {
      enabled = false,
    },
    words = {
      enabled = false,
    },
    zen = {
      enabled = false,
    },
    indent = {
      enabled = true,
      scope = {
        enabled = false,
      },
    },
    terminal = {
      win = {
        -- default position is bottom, like vscode terminal
        position = "float",
      },
    },
  },
}
