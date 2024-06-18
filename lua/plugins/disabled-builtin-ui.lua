-- disabled some LazyVIM built-in ui plugins,
-- because they make it impossible to stay focused
-- https://www.lazyvim.org/plugins/ui
return {
  {
    "folke/noice.nvim",
    enabled = false,
  },
  {
    "nvim-notify",
    enabled = false,
  },
}
