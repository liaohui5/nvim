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

-----------------------------------------
-- neovim options
-----------------------------------------
vim.opt.relativenumber = false
vim.opt.conceallevel = 0
vim.opt.spelllang = {}
vim.opt.swapfile = false

-----------------------------------------
-- custom settings
-----------------------------------------
-- how to trigger the suggestion window to open
vim.g.auto_completation_trigger = "Manual" -- Manual | InsertEnter | TextChanged | Both

-- enable which-key menu icons
vim.g.whichkey_icon_enabeld = false

-- can be use yazi, joshuto, vifm, ranger
-- https://github.com/sxyazi/yazi
-- https://github.com/kamiyaa/joshuto
-- https://github.com/vifm/vifm
-- https://github.com/ranger/ranger
vim.g.terminal_file_manager = "yazi"

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
