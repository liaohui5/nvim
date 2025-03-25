-------------------------------------------------------------------------------------
--- github: https://github.com/saghen/blink.cmp
--- https://github.com/Saghen/blink.cmp/blob/main/lua/blink/cmp/config/keymap.lua
-------------------------------------------------------------------------------------
return {
  {
    {
      "folke/which-key.nvim",
      optional = true,
      opts = {
        spec = {
          { "<leader>t", group = "toggle" },
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    enabled = true,
    opts = {
      completion = {
        keyword = {
          range = "prefix",
        },
        trigger = {
          show_on_trigger_character = false,
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
        -- ["<cr>"] = { "select_and_accept", "fallback" },
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
      {
        -- toggle suggestion enabled
        "<leader>tc",
        function()
          if vim.g.enabled_auto_completion then
            vim.g.enabled_auto_completion = false
            vim.b.completion = false
          else
            vim.g.enabled_auto_completion = true
            vim.b.completion = true
          end
        end,
        desc = "toggle auto completion enabled",
        silent = true,
        mode = "n",
      },
    },
  },
}
