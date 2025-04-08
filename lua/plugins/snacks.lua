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
    dashboard = {
      enabled = true,
      width = 52,
      preset = {
        keys = {
          {
            icon = "󰾅",
            key = "S",
            desc = "Show startuptime",
            action = ":StartupTime",
          },
          {
            icon = "",
            key = "l",
            desc = "Restore last session",
            -- action = ":lua require('persistence').load({ last = true })",
            action = ":SessionManager load_last_session",
          },
          {
            icon = "",
            key = "p",
            desc = "Pick sessions",
            -- action = ":lua require('persistence').select()",
            action = ":SessionManager load_session",
          },
          {
            icon = "",
            key = "s",
            desc = "Search files",
            action = ":lua Snacks.dashboard.pick('files')",
          },
          {
            icon = "󰕁",
            key = "f",
            desc = "Recent files",
            action = ":lua Snacks.dashboard.pick('oldfiles')",
          },
          {
            icon = "",
            key = "c",
            desc = "Configurations",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          {
            icon = "",
            desc = "Lazyvim plugins",
            key = "P",
            action = ":Lazy",
            enabled = package.loaded.lazy ~= nil,
          },
          {
            icon = "󰏓",
            key = "e",
            desc = "Lazyvim extras",
            action = ":LazyExtras",
          },
          {
            icon = "",
            key = "q",
            desc = "Quit neovim",
            action = ":qa",
          },
        },
        header = [[
███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
████╗  ██║ ██╔════╝ ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
██╔██╗ ██║ █████╗   ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
██║╚██╗██║ ██╔══╝   ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
██║ ╚████║ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
      },
      sections = {
        { section = "header", padding = 4 },
        { section = "keys", gap = 1, padding = 4 },
        { section = "startup", icon = "🚀 ", gap = 1 },
      },
    },
  },
}
