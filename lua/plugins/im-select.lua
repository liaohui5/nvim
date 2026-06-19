return {
  "keaising/im-select.nvim",
  event = "VeryLazy",
  enabled = false,
  opts = function()
    return {
      set_default_events = {
        "VimEnter",
        "FocusGained",
        "InsertLeave",
        "CmdlineLeave",
      },
      set_previous_events = {},
      keep_quiet_on_no_binary = true,
      async_switch_im = true,
    }
  end,
}
