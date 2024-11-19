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
    dashboard = {
      enabled = false,
      width = 50,
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
            action = ":SessionManager load_last_session",
          },
          {
            icon = "",
            key = "p",
            desc = "Pick sessions",
            action = ":SessionManager load_session",
          },
          {
            icon = "",
            key = "s",
            desc = "Search files",
            action = ":Telescope find_files",
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
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },
      sections = {
        { section = "header", padding = 5 },
        { section = "keys", gap = 1, padding = 5 },
        { section = "startup" },
      },
    },
  },
}
