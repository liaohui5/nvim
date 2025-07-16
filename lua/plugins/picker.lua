-- https://github.com/ibhagwan/fzf-lua
return {
  {
    "ibhagwan/fzf-lua",
    enabled = false,
    lazy = "VeryLazy",
    keys = {
      { "<leader>ff", false },
    },
    opts = {
      files = {
        cmd = "fd --color=never --no-ignore --hidden --type f --type l --exclude .git",
      },
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      {
        "<c-p>",
        function()
          -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#files
          Snacks.picker.files({
            finder = "files",
            format = "file",
            show_empty = true,
            hidden = true,
            ignored = true,
            follow = false,
            supports_live = true,
            exclude = {
              ".git",
              ".DS_Store",
              "node_modules",
              "vendor",
              "dist",
            },
          })
        end,
        desc = "Find files",
        mode = "n",
      },
    },
  },
}
