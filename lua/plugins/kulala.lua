-- docs: https://www.lazyvim.org/extras/util/rest
return {
  "mistweaverco/kulala.nvim",
  enabled = true,
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
    lsp = {
      enable = true,
      keymaps = false,
      filetypes = { "http", "rest", "json", "yaml", "bruno" },
      formatter = {},
      on_attach = nil,
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
