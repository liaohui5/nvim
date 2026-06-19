return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>bH",
      "<cmd>BufferLineMovePrev<cr>",
      desc = "Move buffer to left",
      mode = "n",
    },
    {
      "<leader>bL",
      "<cmd>BufferLineMoveNext<cr>",
      desc = "Move buffer to right",
      mode = "n",
    },
  },
}
