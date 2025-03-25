return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>r", group = "replace" },
      },
    },
  },
  {
    "roobert/search-replace.nvim",
    event = "VeryLazy",
    opts = {
      -- vim substitute flags
      -- g: global
      -- c: confirm
      -- i: ignore case
      -- I: don't ignore case
      default_replace_single_buffer_options = "gcI",
      default_replace_multi_buffer_options = "egcI",
    },
    keys = {
      {
        "<leader>rr",
        "<cmd>SearchReplaceWithinVisualSelection<cr>",
        desc = "Search and replace in selection",
        mode = "v",
      },
      {
        "<leader>rr",
        "<cmd>SearchReplaceSingleBufferOpen<cr>",
        desc = "Search and replace in selection",
        mode = "n",
      },
      {
        "<leader>rR",
        "<cmd>SearchReplaceMultiBufferOpen<cr>",
        desc = "Search and replace in selection",
        mode = "n",
      },
    },
  },
}
