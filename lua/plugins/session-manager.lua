return {
  {
    -- TODO: use folke/persistence.nvim when pr merged
    -- https://github.com/folke/persistence.nvim/pull/99
    "liaohui5/persistence.nvim",
    event = "VeryLazy",
    enabled = true,
    keys = {
      {
        "<leader>ql",
        function()
          require("persistence").select()
        end,
        desc = "Load session",
        mode = "n",
      },
      {
        "<leader>qd",
        function()
          require("persistence").delete()
        end,
        desc = "Delete session",
        mode = "n",
      },
      {
        "<leader>qs",
        function()
          require("persistence").save()
        end,
        desc = "Save session",
        mode = "n",
      },
    },
  },
  {
    enabled = false,
    "Shatur/neovim-session-manager",
    event = "VeryLazy",
    opts = function(_, opts)
      local Path = require("plenary.path")
      local autoload_mode = require("session_manager.config").AutoloadMode
      local sessions_path = Path:new(vim.fn.stdpath("state"), "sessions")
      return vim.tbl_deep_extend("force", opts, {
        sessions_dir = sessions_path,
        autoload_mode = autoload_mode.CurrentDir, -- Disabled, CurrentDir, LastSession
        autosave_last_session = true,
        autosave_ignore_not_normal = true,
        autosave_only_in_session = true,
        autosave_ignore_filetypes = {
          ".DS_Store",
          "gitcommit",
        },
      })
    end,
    keys = {
      {
        "<leader>ql",
        "<cmd>SessionManager load_session<cr>",
        desc = "Load session",
        mode = "n",
      },
      {
        "<leader>qd",
        "<cmd>SessionManager delete_session<cr>",
        desc = "Delete session",
        mode = "n",
      },
      {
        "<leader>qs",
        "<cmd>SessionManager save_current_session<cr>",
        desc = "Save session",
        mode = "n",
      },
    },
  },
}
