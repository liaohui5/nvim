return {
  "echasnovski/mini.files",
  event = "VeryLazy",
  enabled = false,
  opts = {
    options = {
      -- Whether to use for editing directories
      -- Disabled by default in LazyVim because neo-tree is used for that
      use_as_default_explorer = false,
    },
    mappings = {
      close = "<c-q>",
    },
  },
  keys = {
    {
      "<c-f>",
      "<leader>fm",
      remap = true,
      noremap = true,
    },
  },
}
