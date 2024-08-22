-------------------------------------------------------------------------
-- global custom settings, must be load in init.lua by manual
-------------------------------------------------------------------------
-- enable check plugin updates
vim.g.enable_lazy_check_updates = true

-- how to trigger the suggestion window to open
vim.g.auto_completation_trigger = "Manual" -- Manual | InsertEnter | TextChanged | Both

-- enable which-key menu icons
vim.g.whichkey_icon_enabeld = false

-- can be use yazi, joshuto, vifm, ranger and so on
-- https://github.com/sxyazi/yazi
-- https://github.com/kamiyaa/joshuto
vim.g.terminal_file_manager = "yazi"
