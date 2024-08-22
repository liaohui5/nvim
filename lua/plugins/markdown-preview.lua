return {
  "iamcco/markdown-preview.nvim",
  event = "VeryLazy",
  cmd = {
    "MarkdownPreview",
    "MarkdownPreviewStop",
  },
  ft = {
    "markdown",
  },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    vim.cmd([[do FileType]])
  end,
  keys = {
    {
      "<leader>cp",
      ft = "markdown",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Markdown Preview",
    },
  },
}
