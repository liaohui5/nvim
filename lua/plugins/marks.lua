return {
  -- https://github.com/chentoast/marks.nvim
  "chentoast/marks.nvim",
  lazy = "VeryLazy",
  enabled = true,
  opts = {
    default_mappings = false,
  },
  keys = {
    {
      "<leader>m",
      "<Plug>(Marks-toggle)",
      desc = "Toggle marks",
      mode = "n",
    },
    {
      "<leader>M",
      "<cmd>MarksListAll<cr>",
      desc = "List marks",
      mode = "n",
    },
  },
}
