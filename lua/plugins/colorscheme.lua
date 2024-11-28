return {
  {
    "LazyVim/LazyVim",
    opts = function()
      local switcher = require("helpers.switcher")
      local colorschemes = vim.fn.getcompletion("", "color")

      -- if lazy is available, extend the colors list with unloaded colorschemes
      local lazy = package.loaded["lazy.core.util"]
      if lazy and lazy.get_unloaded_rtp then
        local paths = lazy.get_unloaded_rtp("")
        local all_files = vim.fn.globpath(table.concat(paths, ","), "colors/*", true, 1)
        for _, f in ipairs(all_files) do
          local color = vim.fn.fnamemodify(f, ":t:r")
          if not vim.tbl_contains(colorschemes, color) then
            table.insert(colorschemes, color)
          end
        end
      end

      switcher.new_option("colorscheme", colorschemes, "tokyonight-moon")
      local value = switcher.get_value("colorscheme")
      return { colorscheme = value }
    end,
    keys = {
      {
        "<leader>uS",
        function()
          require("helpers.switcher").switch("colorscheme", function(_, value)
            vim.cmd.colorscheme(value)
          end)
        end,
        desc = "Switch colorscheme forever",
        mode = "n",
      },
    },
  },
  {
    -- tokynight
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
  {
    -- base16
    "RRethy/base16-nvim",
    config = function() end,
    opts = {
      base00 = "#272822",
      base01 = "#383830",
      base02 = "#49483e",
      base03 = "#656866",
      base04 = "#a59f85",
      base05 = "#f8f8f2",
      base06 = "#f5f4f1",
      base07 = "#f9f8f5",
      base08 = "#f92672",
      base09 = "#fd971f",
      base0A = "#f4bf75",
      base0B = "#a6e22e",
      base0C = "#a1efe4",
      base0D = "#66d9ef",
      base0E = "#ae81ff",
      base0F = "#cc6633",
    },
  },
}
