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
vim.g.deprecation_warnings = true

-----------------------------------------
-- global custom settings
-----------------------------------------
-- enable check plugin updates
vim.g.lazy_check_update_enabled = true

-- lazyvim check plugin update frequency
-- every week: 604800
-- every day : 86400
-- every hour: 3600
vim.g.lazy_check_update_frequency = 604800

-- how to trigger the suggestion window to open
vim.g.auto_completation_trigger = "Manual" -- Manual | InsertEnter | TextChanged | Both

-- enable which-key menu icons
vim.g.whichkey_icon_enabeld = false

-- can be use yazi, joshuto, vifm, ranger and so on
-- https://github.com/sxyazi/yazi
-- https://github.com/kamiyaa/joshuto
vim.g.terminal_file_manager = "yazi"

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
