return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    opts = {
      -- supported languages: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        -- it's removed in new version
        enable = false,
      },
    },
    ensure_installed = {
      "just",
    },
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
        function() require("treesj").split() end,
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
}
