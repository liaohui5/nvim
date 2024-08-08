---@diagnostic disable: undefined-field
-- auto switch input method
-- github: https://github.com/keaising/im-select.nvim

-- get im-select command string once by os_info
local im_select_command = (function()
  local os_info = vim.loop.os_uname()
  local command = "im-select"
  if string.find(os_info.release, "WSL") ~= nil then
    command = command .. ".exe"
  end
  return command
end)()

return {
  "keaising/im-select.nvim",
  event = "VeryLazy",
  enabled = function()
    -- disabled im-select in Windows
    local os_info = vim.loop.os_uname()
    if string.find(os_info.sysname, "Windows") then
      return false
    end

    -- check im_select_command is executable
    return vim.fn.executable(im_select_command)
  end,
  opts = function()
    return {
      default_command = im_select_command,
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
