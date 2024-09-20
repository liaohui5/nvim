-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
local api = vim.api

-- custom autocmds for myself
local function augroup(name)
  return api.nvim_create_augroup("user_augroup_" .. name, {
    clear = true,
  })
end

-- disable auto format when save
api.nvim_create_autocmd("FileType", {
  group = augroup("disable_auto_format"),
  pattern = "*",
  callback = function()
    ---@diagnostic disable-next-line: inject-field
    vim.b.autoformat = false
  end,
})

-- auto save when nvim lost focus
api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  group = augroup("auto_save"),
  pattern = "*",
  callback = function(event)
    if not vim.g.auto_save_on_lost_focus_enabled then
      return
    end

    local opts = { buf = event.buf }
    local buf_type = api.nvim_get_option_value("buftype", opts)
    if buf_type ~= "" then
      return
    end

    if not api.nvim_get_option_value("modified", opts) then
      return
    end

    vim.cmd("silent! write")
  end,
})
