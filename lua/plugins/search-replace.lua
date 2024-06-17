return {
  "roobert/search-replace.nvim",
  event = "VeryLazy",
  opts = {
    default_replace_single_buffer_options = "gcI",
    default_replace_multi_buffer_options = "egcI",
  },
  dependencies = {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>r"] = {
          name = "+replace",
        },
      },
    },
  },
  keys = {
    {
      "<leader>rr",
      "<cmd>SearchReplaceSingleBufferOpen<cr>",
      desc = "Replace in buffer",
      mode = "n",
    },
    {
      "<leader>rr",
      "<cmd>SearchReplaceWithinVisualSelection<cr>",
      desc = "Replace in selection",
      mode = "v",
    },
  },
}
