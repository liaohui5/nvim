-- https://www.lazyvim.org/extras/util/rest
return {
  "mistweaverco/kulala.nvim",
  ft = {
    "http",
    "rest",
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
