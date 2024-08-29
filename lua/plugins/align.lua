return {
  {
    -- dependences
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          "<leader>a",
          desc = "algin",
          group = "algin",
          icon = { icon = "" },
        },
      },
    },
  },
  {
    -- align code by string or regexp
    "Vonr/align.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>aa",
        function()
          require("align").align_to_string({
            preview = true,
          })
        end,
        desc = "Align by char",
        mode = "x",
      },
      {
        "<leader>ar",
        function()
          require("align").align_to_string({
            preview = true,
            regexp = true,
          })
        end,
        desc = "Align by string or regexp",
        mode = "x",
      },
    },
  },
}
