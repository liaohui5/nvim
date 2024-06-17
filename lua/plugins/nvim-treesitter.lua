return {
  {
    "nvim-treesitter/nvim-treesitter",
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
      ensure_installed = {
        "css",
        "bash",
        "scss",
        "lua",
        "yaml",
        "pug",
        "html",
        "javascript",
        "json",
        "markdown",
        "markdown_inline",
        "dockerfile",
        "sql",
        "tsx",
        "typescript",
        "toml",
        "vim",
        "vimdoc",
        "vue",
        "rust",
        "git_config",
        "gitignore",
      },
      sync_install = true,
      auto_install = true,
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
    dependencies = { "nvim-treesitter" },
    keys = {
      {
        "ga",
        "<cmd>NodeAction<cr>",
        desc = "Trigger Node Action",
      },
    },
  },
  {
    -- quick split/join multiple lines
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter" },
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
}
