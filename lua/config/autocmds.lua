-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- custom autocmds for myself
local function augroup(name)
  return vim.api.nvim_create_augroup("user_augroup_" .. name, {
    clear = true,
  })
end

-- disable auto format when save
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("disable_auto_format"),
  pattern = "*",
  callback = function()
    ---@diagnostic disable-next-line: inject-field
    vim.b.autoformat = false
  end,
})
