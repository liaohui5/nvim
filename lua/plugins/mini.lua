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
  {
    "echasnovski/mini.align",
    opts = {
      mappings = {
        start = "ga",
        start_with_preview = "gA",
      },
    },
    keys = {
      { "ga", mode = "v", desc = "align by string" },
      { "gA", mode = "v", desc = "align by string with preview" },
    },
  },
  -- {
  --   "echasnovski/mini.files",
  --   event = "VeryLazy",
  --   opts = {
  --     options = {
  --       -- Whether to use for editing directories
  --       -- Disabled by default in LazyVim because neo-tree is used for that
  --       use_as_default_explorer = false,
  --     },
  --     mappings = {
  --       close = "<c-q>",
  --     },
  --   },
  --   keys = {
  --     {
  --       "<c-f>",
  --       "<leader>fm",
  --       remap = true,
  --       noremap = true,
  --     },
  --   },
  -- },
}
