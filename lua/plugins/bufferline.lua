return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    return vim.tbl_deep_extend("force", opts, {
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
    })
  end,
}
