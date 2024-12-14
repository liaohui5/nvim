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
-- vim.g.lazyvim_picker = "auto"
-- vim.g.lazyvim_cmp = "auto"
-- vim.g.ai_cmp = true
-- vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
-- vim.g.root_lsp_ignore = { "copilot" }
-- vim.g.deprecation_warnings = false
-- vim.g.trouble_lualine = true

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
