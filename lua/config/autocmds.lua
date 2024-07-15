-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
local autocmd = vim.api.nvim_create_autocmd
local autogrp = vim.api.nvim_create_augroup

-- custom autocmds for myself
local function augroup(name)
  return autogrp("user_augroup_" .. name, {
    clear = true,
  })
end

-- disable auto format when save
autocmd("FileType", {
  group = augroup("disable_auto_format"),
  pattern = "*",
  callback = function()
    ---@diagnostic disable-next-line: inject-field
    vim.b.autoformat = false
  end,
})

-- auto save when focus lost
-- autocmd({ "BufLeave" }, {
--   group = augroup("auto_save"),
--   pattern = "*",
--   callback = function()
--     local buf = vim.api.nvim_get_current_buf()
--     vim.api.nvim_buf_call(buf, function()
--       vim.cmd("silent! write")
--     end)
--   end,
-- })
