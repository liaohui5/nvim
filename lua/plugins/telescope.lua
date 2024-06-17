return {
  "telescope.nvim",
  keys = {
    { "<leader>ff", false },
  },
  opts = function(_, opts)
    local actions = require("telescope.actions")
    return vim.tbl_deep_extend("force", opts, {
      defaults = {
        mappings = {
          i = {
            ["<c-j>"] = actions.move_selection_next,
            ["<c-k>"] = actions.move_selection_previous,
            ["<c-n>"] = actions.cycle_history_next,
            ["<c-p>"] = actions.cycle_history_prev,
          },
        },
        selection_caret = " ",
        prompt_prefix = "🔭 ",
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        layout_config = {
          width = 0.8, -- width for telescope window
          preview_width = 0.6, -- width for preview section
          prompt_position = "top",
        },
        file_ignore_patterns = {
          "**node_modules",
          "**.git",
          "**.cargo",
        },
      },
    })
  end,
}
