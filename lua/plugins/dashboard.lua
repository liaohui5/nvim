return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
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
            key = "r",
            desc = "Restore last session",
            action = ":SessionManager load_last_session",
          },
          {
            icon = "",
            key = "l",
            desc = "Load session",
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
            icon = "",
            key = "c",
            desc = "Configurations",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          {
            icon = "",
            desc = "Lazyvim plugins",
            key = "p",
            action = ":Lazy",
            enabled = package.loaded.lazy ~= nil,
          },
          {
            icon = "󰏓",
            key = "e",
            desc = "Lazyvim extras",
            action = ":LazyExtras",
            enabled = package.loaded.lazy ~= nil,
          },
          {
            icon = "󰒔",
            key = "m",
            desc = "Mason dashboard",
            action = ":Mason",
            enabled = package.loaded.lazy ~= nil,
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
