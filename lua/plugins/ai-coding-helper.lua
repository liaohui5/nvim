---------------------------------------------------
--- ai helper for coding
---------------------------------------------------
return {
  {
    --- https://github.com/luozhiya/fittencode.nvim
    "luozhiya/fittencode.nvim",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require("fittencode").setup()
    end,
    opts = {
      document_code = {
        show_in_editor_context_menu = false,
      },
      edit_code = {
        show_in_editor_context_menu = false,
      },
      explain_code = {
        show_in_editor_context_menu = false,
      },
      find_bugs = {
        show_in_editor_context_menu = false,
      },
      generate_unit_test = {
        show_in_editor_context_menu = false,
      },
      start_chat = {
        show_in_editor_context_menu = false,
      },
    },
  },
  {
    -- https://github.com/monkoose/neocodeium
    "monkoose/neocodeium",
    event = "VeryLazy",
    enabled = false,
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup()
      vim.keymap.set("i", "<A-f>", neocodeium.accept)
    end,
  },
  {
    -- https://github.com/olimorris/codecompanion.nvim
    "olimorris/codecompanion.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
  },
  {
    -- https://github.com/yetone/avante.nvim
    "yetone/avante.nvim",
    event = "VeryLazy",
    enabled = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
