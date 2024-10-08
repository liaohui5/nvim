return {
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "tokyonight" },
  },
  {
    "folke/tokyonight.nvim",
    enabled = true,
    lazy = true,
    opts = {
      style = "moon", -- night, storm, moon
      on_highlights = function(hl, c)
        -- hidden neo-tree window separate line
        hl["NeoTreeWinSeparator"] = {
          bg = c.bg,
          fg = c.bg,
        }

        -- remove keyworld font italic style
        hl["Keyword"].italic = false
        hl["@keyword"].italic = false

        -- remove comment font italic style
        hl["Comment"].italic = false
      end,
    },
  },
}
