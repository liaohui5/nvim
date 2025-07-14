return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    keys = {
      {
        "+",
        desc = "Increment selection",
        mode = "v",
        noremap = true,
      },
      {
        "_",
        desc = "Decrement selection",
        mode = "v",
        noremap = true,
      },
    },
    opts = {
      -- all supported languages: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          node_incremental = "+",
          node_decremental = "_",
        },
      },
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
      },
    },
  },
  {
    -- auto close xml tag
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    enabled = true,
  },
  {
    -- some quick action based on treesitter
    "ckolkey/ts-node-action",
    event = "VeryLazy",
    vscode = true,
    keys = {
      {
        "ga",
        function()
          require("ts-node-action").node_action()
        end,
        desc = "Trigger Node Action",
        mode = "n",
      },
    },
  },
  {
    -- quick split/join multiple lines
    "Wansmer/treesj",
    event = "VeryLazy",
    vscode = true,
    keys = {
      {
        "gS",
        function()
          require("treesj").split()
        end,
        desc = "Split lines",
        mode = "n",
      },
      {
        "gJ",
        function()
          require("treesj").join()
        end,
        desc = "Join lines",
        mode = "n",
      },
    },
  },
  {
    -- auto toggle end of line comma and semi
    "saifulapm/commasemi.nvim",
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
  },
}
