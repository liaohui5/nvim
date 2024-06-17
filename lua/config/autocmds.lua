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

-- for override LazyVIM default autocmds
local function lazy_augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, {
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

-- Override LazyVIM default: wrap and check for spell in text filetypes
-- https://github1s.com/LazyVim/LazyVim/blob/HEAD/lua/lazyvim/config/autocmds.lua#L87
autocmd("FileType", {
  group = lazy_augroup("wrap_spell"),
  pattern = { "*.txt", "*.tex", "*.typ", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = false
    vim.opt_local.spell = false
  end,
})
