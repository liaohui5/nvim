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
vim.g.autoformat = false
vim.g.snacks_animate = false
vim.g.lazyvim_picker = "auto"

-----------------------------------------
-- neovim options
-----------------------------------------
vim.opt.relativenumber = false
vim.opt.conceallevel = 0
vim.opt.spelllang = {}
vim.opt.swapfile = false

-----------------------------------------
-- custom global settings
-----------------------------------------
-- can be use yazi, joshuto, vifm, ranger and so on
-- https://github.com/sxyazi/yazi
-- https://github.com/kamiyaa/joshuto
-- https://github.com/ranger/ranger
-- https://github.com/vifm/vifm
vim.g.terminal_file_manager = "yazi"

-----------------------------------------
-- disabled default modules
-----------------------------------------
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local disabled_providers = {
  -- "node",
  -- "python3",
  "perl",
  "ruby",
}
for _, provider in ipairs(disabled_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
