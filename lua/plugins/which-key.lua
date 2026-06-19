return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "classic",
    disable = {
      ft = {
        -- disable in file explorer sidebar
        "TelescopePrompt",
        "NvimTree",
        "neo-tree",
        "snacks_picker_list",
      },
    },
    icons = {
      -- disabled icon
      mappings = false,
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
