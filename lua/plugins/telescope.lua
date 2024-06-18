return {
  "telescope.nvim",
  keys = {
    { "<leader>ff", false },
  },
  opts = function(_, opts)
    local actions = require("telescope.actions")
    local preview_half_width = {
      layout_config = {
        preview_width = 0.5,
      },
    }
    return vim.tbl_deep_extend("force", opts, {
      defaults = {
        selection_caret = " ",
        prompt_prefix = "🔭 ",
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<c-j>"] = actions.move_selection_next,
            ["<c-k>"] = actions.move_selection_previous,
            ["<c-n>"] = actions.cycle_history_next,
            ["<c-p>"] = actions.cycle_history_prev,
            ["<c-q>"] = actions.close,
          },
        },
        layout_config = {
          prompt_position = "top",
        },
        file_ignore_patterns = {
          "**node_modules",
          "**.git",
          "**.cargo",
        },
      },

      pickers = {
        git_files = preview_half_width,
        live_grep = preview_half_width,
        highlights = preview_half_width,
      },
    })
  end,
}
