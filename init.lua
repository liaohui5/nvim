--  .----------------.  .-----------------. .----------------.  .----------------.
-- | .--------------. || .--------------. || .--------------. || .--------------. |
-- | |     _____    | || | ____  _____  | || |     _____    | || |  _________   | |
-- | |    |_   _|   | || ||_   \|_   _| | || |    |_   _|   | || | |  _   _  |  | |
-- | |      | |     | || |  |   \ | |   | || |      | |     | || | |_/ | | \_|  | |
-- | |      | |     | || |  | |\ \| |   | || |      | |     | || |     | |      | |
-- | |     _| |_    | || | _| |_\   |_  | || |     _| |_    | || |    _| |_     | |
-- | |    |_____|   | || ||_____|\____| | || |    |_____|   | || |   |_____|    | |
-- | |              | || |              | || |              | || |              | |
-- | '--------------' || '--------------' || '--------------' || '--------------' |
--  '----------------'  '----------------'  '----------------'  '----------------'
-- neovide gui client: https://neovide.dev
if vim.g.neovide then
  require("client.neovide")
end

-- bootstrap LazyVIM and plugins
---@diagnostic disable-next-line: different-requires
require("config.lazy")

-----------------------------------------------------------------------------------
-- load local plugin development environment example
-----------------------------------------------------------------------------------

-- vim.opt.runtimepath:append("$HOME/codes/persistence.nvim")
-- local plugin = require("persistence")
-- plugin.setup({})
--
-- local keys = {
--   {
--     lhs = "<leader>qp",
--     rhs = function()
--       require("persistence").select()
--     end,
--     desc = "Pick sessions",
--     mode = "n",
--   },
--   {
--     lhs = "<leader>ql",
--     rhs = function()
--       require("persistence").load({ last = true })
--     end,
--     desc = "Load last session",
--     mode = "n",
--   },
--   {
--     lhs = "<leader>qd",
--     rhs = function()
--       require("persistence").delete()
--     end,
--     desc = "Delete sessions",
--     mode = "n",
--   },
--   {
--     lhs = "<leader>qs",
--     rhs = function()
--       require("persistence").save()
--     end,
--     desc = "Save session",
--     mode = "n",
--   },
-- }
-- for _, item in pairs(keys) do
--   vim.keymap.set(item.mode, item.lhs, item.rhs, {
--     desc = item.desc,
--   })
-- end
