-------------------------------------------------------------------------------------
--- github: https://github.com/saghen/blink.cmp
--- https://github.com/Saghen/blink.cmp/blob/main/lua/blink/cmp/config/keymap.lua
-------------------------------------------------------------------------------------
return {
  "saghen/blink.cmp",
  enabled = true,
  opts = {
    min_keyword_length = 1,
    enabled = function()
      -- TODO: disable auto completation when switcher value is false
      if require("helpers.switcher").is("auto_completation_enabled", false) then
        return false
      end

      -- disable auto completation in comments
      -- local node = vim.treesitter.get_node()
      -- if node and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
      --   return false
      -- end

      -- disable auto completation in prompt
      return vim.bo.buftype ~= "prompt"
    end,
    menu = {
      scrollbar = false,
    },
    completion = {
      show_in_snippet = false,
      show_on_accept_on_trigger_character = false,
      show_on_insert_on_trigger_character = false,
      show_on_trigger_character = false,
    },
    keymap = {
      ["<c-o>"] = { "show", "show_documentation", "hide_documentation" },
      ["<c-e>"] = { "cancel", "fallback" },
      ["<cr>"] = { "select_and_accept", "fallback" },
      ["<c-k>"] = { "select_prev", "fallback" },
      ["<c-j>"] = { "select_next", "fallback" },
      ["<c-b>"] = { "scroll_documentation_up", "fallback" },
      ["<c-f>"] = { "scroll_documentation_down", "fallback" },
      ["<tab>"] = { "snippet_forward", "fallback" },
      ["<s-tab>"] = { "snippet_backward", "fallback" },
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
      -- toggle auto completation enabled
      "<leader>ct",
      function()
        require("helpers.switcher").init_and_switch_option_value({
          option_name = "auto_completation_enabled",
          allow_values = { true, false },
          default_value = true,
        })
      end,
      desc = "toggle auto completation",
      mode = "n",
    },
  },
}
