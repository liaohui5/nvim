----------------------------------------------------
--- github: https://github.com/mikavilpas/yazi.nvim
----------------------------------------------------
return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<c-f>",
      "<cmd>Yazi<cr>",
      desc = "Open yazi file manager",
    },
    {
      "<c-n>",
      "<cmd>Yazi cwd<cr>",
      desc = "Open yazi file manager(Root)",
    },
    {
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  opts = {
    open_for_directories = false,
    floating_window_scaling_factor = 0.8,
    yazi_floating_window_winblend = 1,
    keymaps = {
      show_help = "?",
      open_file_in_vertical_split = "<c-x>",
      open_file_in_horizontal_split = "<c-v>",
      send_to_quickfix_list = "<c-s>",
      -- must be install `grealpath` first on macOS(brew install coreutils)
      copy_relative_path_to_selected_files = "<c-y>",
      open_file_in_tab = false,
      grep_in_directory = false,
      replace_in_directory = false,
      cycle_open_buffers = false,
      change_working_directory = false,
    },
  },
}
