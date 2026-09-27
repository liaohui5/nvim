return {
  "mistweaverco/kulala.nvim",
  enabled = false,
  ft = {
    "http",
    "rest",
  },
  opts = {
    kulala_keymaps = {
      ["Show verbose"] = {
        "C",
        function()
          require("kulala.ui").show_verbose()
        end,
      },
    },
  },
  keys = {
    {
      "<c-enter>",
      "<leader>Rs",
      desc = "Rest: Send",
      remap = true,
      mode = "n",
    },
  },
}
