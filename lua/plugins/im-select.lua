---@diagnostic disable: undefined-field
-- auto switch input method
-- github: https://github.com/keaising/im-select.nvim
return {
  "keaising/im-select.nvim",
  event = "VeryLazy",
  enabled = function()
    -- disabled im-select in Windows
    local os_info = vim.loop.os_uname()
    return string.find(os_info.sysname, "Windows") == nil
  end,
  opts = function()
    local os_info = vim.loop.os_uname()
    local command = "im-select"

    -- enabled im-select in wsl
    -- must be add im-select.exe to environment PATH
    if string.find(os_info.release, "WSL") ~= nil then
      command = command .. ".exe"
    end

    return {
      default_command = command,
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
