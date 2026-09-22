-----------------------------------------
-- neovim options
-----------------------------------------
vim.opt.autowrite = true
vim.opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
vim.opt.foldtext = ""
-- vim.opt.formatexpr = "v:lua.LazyVim.format.formatexpr()"
vim.opt.formatoptions = "jcroqlnt"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.jumpoptions = "view"
vim.opt.laststatus = 3
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.ruler = false
vim.opt.scrolloff = 4
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smoothscroll = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
-- vim.opt.statuscolumn = [[%!v:lua.LazyVim.statuscolumn()]]
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = vim.g.vscode and 1000 or 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200
vim.opt.virtualedit = "block"
vim.opt.wildmode = "longest:full,full"
vim.opt.winminwidth = 5
vim.opt.relativenumber = false
vim.opt.conceallevel = 0
vim.opt.spelllang = {}
vim.opt.swapfile = false
vim.opt.linebreak = false
vim.opt.wrap = false
vim.opt.list = false
vim.opt.listchars = {
  tab = "  ↹",
  eol = "↩",
  space = ".",
  extends = "◀",
  precedes = "▶",
}

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

-----------------------------------------
-- set nvim default colorscheme
-----------------------------------------
vim.cmd([[colorscheme habamax]])
