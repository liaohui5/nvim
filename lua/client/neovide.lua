-- stylua: ignore start
----------------------------------------------------------------------------------
-- neovide client configuration
-- https://github.com/neovide/neovide
-- https://neovide.dev/configuration.html#configuration
----------------------------------------------------------------------------------
-- set neovide extra global options
----------------------------------------------------------------------------------
-- vim.g.neovide_cursor_vfx_mode         = ""
-- vim.g.neovide_transparency            = 0.8
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_fullscreen              = false
vim.g.neovide_remember_window_size    = true
vim.g.neovide_input_macos_alt_is_meta = true
vim.g.neovide_input_use_logo          = true
vim.g.neovide_profiler                = false

----------------------------------------------------------------------------------
-- set gui font family
-- https://neovide.dev/configuration.html#font
----------------------------------------------------------------------------------
vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h16:#e-subpixelantialias:#h-sLight"

----------------------------------------------------------------------------------
-- bind hotkeys in neovide
----------------------------------------------------------------------------------
local map = vim.api.nvim_set_keymap
local opts = {
  noremap = true,
  silent = true,
}
map("v", "<D-c>", '"+y', opts)       -- Copy
map("n", "<D-v>", '"+P', opts)       -- Paste normal mode
map("v", "<D-v>", '"+P', opts)       -- Paste visual mode
map("c", "<D-v>", "<c-R>+", opts)    -- Paste command mode
map("i", "<D-v>", '<ESC>"+PA', opts) -- Paste insert mode
