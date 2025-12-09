-------------------------------------------------------------------------------------
--- github: https://github.com/saghen/blink.cmp
--- https://github.com/Saghen/blink.cmp/blob/main/lua/blink/cmp/config/keymap.lua
--- docs: https://cmp.saghen.dev/
-------------------------------------------------------------------------------------
return {
  "saghen/blink.cmp",
  enabled = true,
  lazy = "VeryLazy",
  dependencies = {
    -- "marcoSven/blink-cmp-yanky",
    -- "archie-judd/blink-cmp-words",
    -- "Kaiser-Yang/blink-cmp-avante",
  },
  opts = {
    sources = {
      default = {
        "lsp",
        "snippets",
        "path",
        "buffer",
      },
    },
    completion = {
      keyword = {
        range = "prefix",
      },
      trigger = {
        show_on_trigger_character = false,
      },
      accept = {
        auto_brackets = {
          enabled = false,
        },
      },
    },
    keymap = {
      preset = "default",
      ["<c-space>"] = false, -- for switch input method
      ["<c-i>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
      ["<c-o>"] = {
        function(cmp)
          cmp.show({ providers = { "snippets" } })
        end,
      },
      ["<c-k>"] = { "select_prev", "fallback" },
      ["<c-j>"] = { "select_next", "fallback" },
      ["<cr>"] = { "select_and_accept", "fallback" },
    },
    cmdline = {
      keymap = {
        preset = "inherit",
        ["<c-o>"] = { "show", "fallback" },
      },
      completion = {
        menu = {
          auto_show = false,
        },
      },
    },
  },
  keys = {
    {
      -- select previous suggestion item
      "<c-l>",
      function()
        if vim.snippet.active({ direction = 1 }) then
          vim.snippet.jump(1)
        else
          vim.snippet.stop()
        end
      end,
      silent = true,
      mode = { "i", "s" },
    },
    {
      -- select next suggestion item
      "<c-h>",
      function()
        if vim.snippet.active({ direction = -1 }) then
          vim.snippet.jump(-1)
        else
          vim.snippet.stop()
        end
      end,
      silent = true,
      mode = { "i", "s" },
    },
  },
}
