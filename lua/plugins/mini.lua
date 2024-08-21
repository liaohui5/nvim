return {
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    keys = {
      {
        "<c-\\>",
        "gcc",
        remap = true,
        noremap = true,
        mode = "n",
      },
      {
        "<c-\\>",
        "gc",
        remap = true,
        noremap = true,
        mode = "v",
      },
    },
  },
  {
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
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "gss",
        delete = "gsd",
        replace = "gsr",
        highlight = "gsh",
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    enabled = true,
  },
}
