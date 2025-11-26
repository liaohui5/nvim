-- https://github.com/folke/noice.nvim
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  keys = {
    { "<c-f>", false },
    { "<c-b>", false },
  },
  opts = {
    -- cmdline = {
    --   enabled = true,
    -- },
  },
}
