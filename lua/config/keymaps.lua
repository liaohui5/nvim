-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local map = vim.keymap.set

local function opts(desc, remap, noremap)
  return {
    remap = remap or true,
    noremap = noremap or true,
    desc = desc,
  }
end

-- better move to end of line
map({ "n", "v" }, "$", "$h", opts("End of line"))

map("n", "<leader>ff", "<leader>cf", opts("Format Document"))

map("n", "<leader>fs", "<c-s>", opts("Save Document"))

map("n", "<c-e>", "<leader>e", opts("Open file explorer"))

map("n", "<c-g>", "<leader>gg", opts("Open lazygit"))

map("n", "<c-q>", "<leader>qq", opts("Quit"))

map("n", "<c-p>", "<leader><leader>", opts("Find files"))

map("n", "<c-u>", "5kzz", opts("Scroll up"))

map("n", "<c-d>", "5jzz", opts("Scroll down"))

map({ "n", "t" }, "<c-x>", "<c-_>", opts("Open terminal"))

map({ "t", "c" }, "<c-h>", "<Left>", opts("Move left"))

map({ "t", "c" }, "<c-l>", "<Right>", opts("Move right"))

-- can be use yazi, joshuto, vifm, ranger
-- https://github.com/sxyazi/yazi
-- https://github.com/kamiyaa/joshuto
-- https://github.com/vifm/vifm
-- https://github.com/ranger/ranger
local file_manager = "yazi"
if vim.fn.executable(file_manager) then
  local open_file_manager = function(open_path)
    LazyVim.terminal.open({ file_manager, open_path }, {
      esc_esc = false,
      ctrl_hjkl = false,
    })
  end

  map("n", "<c-f>", function()
    open_file_manager(vim.fn.expand("%:p:h"))
  end, opts("Open file manager"))

  map("n", "<c-n>", function()
    open_file_manager(LazyVim.root.get())
  end, opts("Open file manager(cwd)"))
else
  print(string.format("Please install %s first", file_manager))
end
