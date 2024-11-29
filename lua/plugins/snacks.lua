return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    words = {
      enabled = false,
    },
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

        -- startup infomations
        function(dashboard)
          dashboard.stats = dashboard.stats and dashboard.stats.startuptime > 0 or require("lazy.stats").stats()
          local loaded_plugins = dashboard.stats.loaded .. "/" .. dashboard.stats.count
          local load_used_tims = (math.floor(dashboard.stats.startuptime * 100 + 0.5) / 100) .. "ms"
          return {
            align = "center",
            text = {
              { "🚀 neovim loaded ", hl = "footer" },
              { loaded_plugins, hl = "special" },
              { " packages in ", hl = "footer" },
              { load_used_tims, hl = "special" },
            },
          }
        end,
      },
    },
  },
}
