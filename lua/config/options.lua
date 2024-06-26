-----------------------------------------------------------------------
-- Neovim base options
-- LazyVim default options: https://github1s.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- online chinese docs    : https://yianwillis.github.io/vimcdoc/doc/help.html
-- Options are automatically loaded before lazy.nvim startup
-----------------------------------------------------------------------
-- leader key settings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.autoformat = true

-- options
vim.opt.relativenumber = false
vim.opt.conceallevel = 0
vim.opt.spelllang = {}
vim.opt.swapfile = false

-- disabled some language provider
local disabled_providers = {
  -- "node",
  -- "python3",
  "perl",
  "ruby",
}
for _, provider in ipairs(disabled_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
