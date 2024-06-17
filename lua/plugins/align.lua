return {
  -- align code by string or regexp
  "Vonr/align.nvim",
  event = "VeryLazy",
  dependencies = {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>a"] = { name = "+align" },
      },
    },
  },
  keys = {
    {
      "<leader>aa",
      "<cmd>lua require('align').align_to_string({ preview = true })<cr>",
      desc = "Align by string",
      mode = "v",
    },
    {
      "<leader>ar",
      "<cmd>lua require('align').align_to_string({ regex = true, preview = true })<cr>",
      desc = "Align by string or regexp",
      mode = "v",
    },
  },
}
