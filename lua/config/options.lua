-------------------------------------------------------------------------------------------------------
-- Neovim base options
-- LazyVim default options: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- online chinese docs    : https://yianwillis.github.io/vimcdoc/doc/help.html
-- Options are automatically loaded before lazy.nvim startup
-------------------------------------------------------------------------------------------------------
-----------------------------------------
-- lazyvim global settings
-----------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.autoformat = true

-- can be use yazi, joshuto, vifm, ranger and so on
-- https://github.com/sxyazi/yazi
-- https://github.com/kamiyaa/joshuto
-- https://github.com/ranger/ranger
vim.g.terminal_file_manager = "yazi"

-- default enabled auto save when lost focus
vim.g.auto_save_on_lost_focus_enabled = true

-----------------------------------------
-- neovim options
-----------------------------------------
vim.opt.relativenumber = false
vim.opt.conceallevel = 0
vim.opt.spelllang = {}
vim.opt.swapfile = false

-----------------------------------------
-- disabled some language provider
-----------------------------------------
local disabled_providers = {
  -- "node",
  -- "python3",
  "perl",
  "ruby",
}
for _, provider in ipairs(disabled_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
