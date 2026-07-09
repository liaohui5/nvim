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
  version = not vim.g.lazyvim_blink_main and "*",
  event = { "InsertEnter", "CmdlineEnter" },
  opts_extend = {
    "sources.completion.enabled_providers",
    "sources.compat",
    "sources.default",
  },
  opts = {
    completion = {
      ghost_text = {
        enabled = false,
      },
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
      ["<C-space>"] = false, -- for switch input method
      ["<C-o>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
      ["<C-h>"] = { "snippet_backward", "fallback" },
      ["<C-l>"] = { "snippet_forward", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<Tab>"] = {
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
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
    cmdline = {
      keymap = {
        preset = "inherit",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept_and_enter", "fallback" },
        ["<C-h>"] = false,
        ["<C-l>"] = false,
      },
      completion = {
        menu = {
          auto_show = function(ctx)
            return vim.fn.getcmdtype() == ":" and ctx.bounds.length > 1
          end,
        },
      },
    },
  },
}
