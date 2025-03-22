return {
  "saifulapm/commasemi.nvim",
  lazy = false,
  opts = {
    keymaps = false,
    commands = true,
  },
  keys = {
    {
      "<leader>,",
      "<cmd>CommaToggle<cr>",
      desc = "Toggle comma",
      mode = { "n", "v" },
    },
    {
      "<leader>;",
      "<cmd>SemiToggle<cr>",
      desc = "Toggle semi",
      mode = { "n", "v" },
    },
  },
}
