return {
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "tokyonight" },
  },
  {
    -- tokynight
    "folke/tokyonight.nvim",
    enabled = true,
    lazy = true,
    opts = {
      style = "moon", -- night, storm, moon, day
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
  },
}
