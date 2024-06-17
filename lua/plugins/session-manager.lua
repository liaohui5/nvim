return {
  { "persistence.nvim", enabled = false },
  {
    -- use neovim session manager replace persistence
    "Shatur/neovim-session-manager",
    enabled = true,
    event = "VeryLazy",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
      },
      {
        "folke/which-key.nvim",
        opts = {
          defaults = {
            ["<leader>q"] = {
              name = "+quit", -- replace "quit/session"
            },
            ["<leader>p"] = {
              name = "+session",
            },
          },
        },
      },
    },
    opts = function(_, opts)
      local autoload_mode = require("session_manager.config").AutoloadMode
      local sessions_path = vim.fn.stdpath("data") .. "/sessions"
      return vim.tbl_deep_extend("force", opts, {
        sessions_dir = sessions_path,
        autoload_mode = autoload_mode.Disabled, -- Disabled, CurrentDir, LastSession
        path_replacer = "__",
        colon_replacer = "++",
        autosave_last_session = true,
        autosave_ignore_not_normal = true,
        autosave_only_in_session = true,
        max_path_length = 80,
        autosave_ignore_filetypes = {
          ".DS_Store",
          "gitcommit",
        },
      })
    end,
    keys = {
      {
        "<leader>pr",
        "<cmd>SessionManager load_last_session<cr>",
        desc = "Load last session",
        mode = "n",
      },
      {
        "<leader>pc",
        "<cmd>SessionManager load_current_dir_session<cr>",
        desc = "Load current session",
        mode = "n",
      },
      {
        "<leader>pl",
        "<cmd>SessionManager load_session<cr>",
        desc = "Pick sessions",
        mode = "n",
      },
      {
        "<leader>pd",
        "<cmd>SessionManager delete_session<cr>",
        desc = "Delete sessions",
        mode = "n",
      },
      {
        "<leader>ps",
        "<cmd>SessionManager save_current_session<cr>",
        desc = "Save sessions",
        mode = "n",
      },
    },
  },
}
