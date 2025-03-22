return {
  "saifulapm/commasemi.nvim",
  lazy = false,
  vscode = true,
  opts = {
    keymaps = false,
    commands = true,
  },
  keys = {
    {
      "gb",
      "<cmd>CommaToggle<cr>",
      desc = "Toggle comma",
      mode = "n",
    },
    {
      "gB",
      "<cmd>SemiToggle<cr>",
      desc = "Toggle semi",
      mode = "n",
    },
  },
}
