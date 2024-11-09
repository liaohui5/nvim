return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
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
    keys = function(_, keys)
      local opts = LazyVim.opts("mini.surround")
      local mappings = {
        { opts.mappings.add, desc = "Add Surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "Delete Surrounding" },
        { opts.mappings.find, desc = "Find Right Surrounding" },
        { opts.mappings.find_left, desc = "Find Left Surrounding" },
        { opts.mappings.highlight, desc = "Highlight Surrounding" },
        { opts.mappings.replace, desc = "Replace Surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
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
