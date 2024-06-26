-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local map = vim.keymap.set

map("n", "<leader>ff", "<leader>cf", {
  remap = true,
  noremap = true,
  desc = "Format Document",
})

map("n", "<leader>fs", "<c-s>", {
  remap = true,
  noremap = true,
  desc = "Save",
})

map("n", "<c-e>", "<leader>e", {
  remap = true,
  noremap = true,
})

map("n", "<c-g>", "<leader>gg", {
  remap = true,
  noremap = true,
})

map("n", "<c-q>", "<leader>qq", {
  remap = true,
  noremap = true,
})

map("n", "<c-p>", "<leader><leader>", {
  remap = true,
  noremap = true,
})

map("n", "<c-u>", "5kzz", {
  remap = true,
  noremap = true,
})

map("n", "<c-d>", "5jzz", {
  remap = true,
  noremap = true,
})

map({ "n", "t" }, "<c-x>", "<c-_>", {
  remap = true,
  noremap = true,
})

map({ "t", "c" }, "<c-h>", "<Left>", {
  remap = true,
  noremap = true,
})

map({ "t", "c" }, "<c-l>", "<Right>", {
  remap = true,
  noremap = true,
})

-- can be use yazi, joshuto, vifm, ranger
-- https://github.com/sxyazi/yazi
-- https://github.com/kamiyaa/joshuto
-- https://github.com/vifm/vifm
-- https://github.com/ranger/ranger
local fileManager = "yazi"
if vim.fn.executable(fileManager) then
  map("n", "<c-f>", function()
    LazyVim.terminal.open({ fileManager, LazyVim.root.get() })
  end, {
    noremap = true,
    desc = "Open file manager(cwd)",
  })

  map("n", "<c-n>", function()
    LazyVim.terminal.open({ fileManager, vim.fn.expand("%:p:h") })
  end, {
    noremap = true,
    desc = "Open file manager",
  })
else
  print(string.format("Please install %s first", fileManager))
end
