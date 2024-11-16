return {
  { "persistence.nvim", enabled = false },
  {
    -- dependencies
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          "<leader>p",
          group = "session",
          mode = "n",
          icon = { icon = "" },
        },
        {
          -- override lazyvim default group
          "<leader>q",
          group = "quit",
          mode = "n",
          desc = "quit",
        },
      },
    },
  },
  {
    -- use neovim session manager replace persistence
    "Shatur/neovim-session-manager",
    enabled = true,
    event = "VeryLazy",
    opts = function(_, opts)
      local Path = require("plenary.path")
      local autoload_mode = require("session_manager.config").AutoloadMode
      local sessions_path = Path:new(vim.fn.stdpath("state"), "sessions")
      return vim.tbl_deep_extend("force", opts, {
        sessions_dir = sessions_path,
        autoload_mode = autoload_mode.Disabled, -- Disabled, CurrentDir, LastSession
        autosave_last_session = true,
        autosave_ignore_not_normal = true,
        autosave_only_in_session = true,
        autosave_ignore_filetypes = {
          ".DS_Store",
          "gitcommit",
        },
      })
    end,
  },
}
