return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      always_show_bufferline = false,
      offsets = {
        {
          filetype = "neo-tree", -- neo-tree, NvimTree
          highlight = "Directory",
          text = "Explorer",
          text_align = "center", -- left, center, right
        },
      },
    },
  },
}
