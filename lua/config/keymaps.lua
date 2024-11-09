-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local map = vim.keymap.set

-- see more arguments :h map-arguments
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

map("n", "<leader>rn", "<leader>cr", opts("Rename Symbol"))

map("n", "<leader>fs", "<cmd>wa!<cr>", opts("Save", false))

map("n", "<c-e>", "<leader>e", opts("Open file explorer"))

map("n", "<c-g>", "<leader>gg", opts("Open lazygit"))

map("n", "<c-q>", "<leader>qq", opts("Quit"))

map("n", "<c-p>", "<leader><leader>", opts("Find files"))

map("n", "<c-u>", "5kzz", opts("Scroll up"))

map("n", "<c-d>", "5jzz", opts("Scroll down"))

map({ "n", "t" }, "<c-x>", "<c-_>", opts("Open terminal"))

map({ "t", "c" }, "<c-h>", "<Left>", opts("Move left"))

map({ "t", "c" }, "<c-l>", "<Right>", opts("Move right"))

-- restart lsp server
map("n", "<leader>rs", function()
  local options = {}
  local prompt_options = {
    prompt = "Select LSP server to restart",
  }
  local lsp_servers = vim.lsp.get_clients()
  for _, server in ipairs(lsp_servers) do
    table.insert(options, server.config.name)
  end

  vim.ui.select(options, prompt_options, function(choice)
    if not choice then
      -- cancled
      return
    end
    vim.cmd("LspRestart " .. choice)
  end)
end, opts("Restart LSP server", false))

-- open tui file explorer, liek yazi/joshuto/vifm/ranger
local file_manager = vim.g.terminal_file_manager
if vim.fn.executable(file_manager) then
  local open_file_manager = function(open_path)
    Snacks.terminal.toggle({ file_manager, open_path }, {
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
