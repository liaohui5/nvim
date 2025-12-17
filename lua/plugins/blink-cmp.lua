-------------------------------------------------------------------------------------
--- github: https://github.com/saghen/blink.cmp
--- docs: https://cmp.saghen.dev/
--- https://github1s.com/Saghen/blink.cmp/blob/main/lua/blink/cmp/config/keymap.lua
--- https://github1s.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/coding/blink.lua
-------------------------------------------------------------------------------------
return {
  "saghen/blink.cmp",
  enabled = true,
  lazy = "VeryLazy",
  opts = {
    ---- https://cmp.saghen.dev/configuration/sources.html
    completion = {
      keyword = {
        range = "full",
      },
      trigger = {
        show_on_keyword = true,
        show_on_insert_on_trigger_character = true,
      },
    },
    keymap = {
      preset = "default",
      ["<c-space>"] = false, -- for switch input method
      ["<c-o>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
      ["<c-h>"] = { "snippet_backward", "fallback" },
      ["<c-l>"] = { "snippet_forward", "fallback" },
      ["<c-k>"] = { "select_prev", "fallback" },
      ["<c-j>"] = { "select_next", "fallback" },
      ["<cr>"] = { "select_and_accept", "fallback" },
      ["<tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<s-tab>"] = { "snippet_backward", "fallback" },
    },
    cmdline = {
      keymap = {
        preset = "inherit",
        ["<c-o>"] = { "show", "show_and_insert_or_accept_single", "fallback" },
        ["<tab>"] = { "show", "show_and_insert_or_accept_single", "select_next", "fallback" },
        ["<s-tab>"] = { "select_prev", "fallback" },
      },
      completion = {
        menu = {
          auto_show = false
        },
      },
    },
  },
  ---- use blink commands --
  -- keys = {
  --   {
  --     -- select previous suggestion item
  --     "<c-l>",
  --     function()
  --       if vim.snippet.active({ direction = 1 }) then
  --         vim.snippet.jump(1)
  --       else
  --         vim.snippet.stop()
  --       end
  --     end,
  --     silent = true,
  --     mode = { "i", "s" },
  --   },
  --   {
  --     -- select next suggestion item
  --     "<c-h>",
  --     function()
  --       if vim.snippet.active({ direction = -1 }) then
  --         vim.snippet.jump(-1)
  --       else
  --         vim.snippet.stop()
  --       end
  --     end,
  --     silent = true,
  --     mode = { "i", "s" },
  --   },
  -- },
}
