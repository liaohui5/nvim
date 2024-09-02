-- stylua: ignore start
----------------------------------------------------------------------------------
-- neovide client configuration
-- https://github.com/neovide/neovide
-- https://neovide.dev/configuration.html#configuration
----------------------------------------------------------------------------------
-- set neovide extra global options
----------------------------------------------------------------------------------
vim.g.neovide_cursor_animation_length     = 0.05
vim.g.neovide_cursor_antialiasing         = true
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_scroll_animation_length     = 0.1
vim.g.neovide_fullscreen                  = false
vim.g.neovide_profiler                    = false
vim.g.linespace                           = 0.8
vim.g.neovide_text_contrast               = 0.8

----------------------------------------------------------------------------------
-- set gui font family
-- https://neovide.dev/configuration.html#font
----------------------------------------------------------------------------------
-- vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h16"

----------------------------------------------------------------------------------
-- bind hotkeys in neovide
----------------------------------------------------------------------------------
local map = vim.keymap.set
local opts = {
  noremap = true,
  silent = true,
  remap = false,
}
map("v", "<D-c>", '"+y', opts)       -- Copy
map("n", "<D-v>", '"+P', opts)       -- Paste normal mode
map("v", "<D-v>", '"+P', opts)       -- Paste visual mode
map("c", "<D-v>", "<c-R>+", opts)    -- Paste command mode
map("i", "<D-v>", '<ESC>"+PA', opts) -- Paste insert mode
