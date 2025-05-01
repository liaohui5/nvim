-- https://github.com/ibhagwan/fzf-lua
return {
  "ibhagwan/fzf-lua",
  lazy = "VeryLazy",
  keys = {
    { "<leader>ff", false },
  },
  opts = {
    files = {
      cmd = "fd --color=never --no-ignore --hidden --type f --type l --exclude .git",
    },
  },
}
