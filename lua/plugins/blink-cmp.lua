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
      ["<c-o>"] = { "show", "show_documentation", "hide_documentation" },
      ["<c-e>"] = { "cancel", "fallback" },
      ["<c-k>"] = { "select_prev", "fallback" },
      ["<c-j>"] = { "select_next", "fallback" },
      ["<c-b>"] = { "scroll_documentation_up", "fallback" },
      ["<c-f>"] = { "scroll_documentation_down", "fallback" },
      ["<tab>"] = { "snippet_forward", "fallback" },
      ["<s-tab>"] = { "snippet_backward", "fallback" },
      ["<cr>"] = { "select_and_accept", "fallback" },
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
