------------------------------------------------------------------------------------
-- find more info about nvim-cmp.nvim
-- github: https://github.com/hrsh7th/nvim-cmp
-- config: https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/default.lua
------------------------------------------------------------------------------------
return {
  "hrsh7th/nvim-cmp",
  event = "VeryLazy",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local cmp = require("cmp")
    local ctx = require("cmp.config.context")

    -- https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/default.lua
    local default_config = cmp.get_config()

    -- disable nvim-cmp plugin in comment
    opts.enabled = function()
      if ctx.in_treesitter_capture("comment") or ctx.in_syntax_group("Comment") then
        return false
      end
      return default_config.enabled()
    end

    -- how to trigger code completation window
    -- opts.completion.autocomplete = {}

    -- default value is too fast
    -- opts.performance = vim.tbl_extend("force", default_config.performance, {
    --   debounce = 300,
    --   throttle = 500,
    --   fetching_timeout = 500,
    --   confirm_resolve_timeout = 100,
    --   async_budget = 1,
    --   max_view_entries = 100,
    -- })

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<c-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<c-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<c-b>"] = cmp.mapping.scroll_docs(-5),
      ["<c-f>"] = cmp.mapping.scroll_docs(5),
      ["<c-o>"] = cmp.mapping.complete(),
      ["<c-e>"] = cmp.mapping.abort(),
      ["<cr>"] = cmp.mapping.confirm({ select = true }),
      ["<s-cr>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }),
      ["<c-cr>"] = function(fallback)
        cmp.abort()
        fallback()
      end,
      ["<tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ select = true })
        elseif vim.snippet.active({ direction = 1 }) then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<s-tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.snippet.active({ direction = -1 }) then
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
        else
          fallback()
        end
      end, { "i", "s" }),
    })
  end,

  keys = {
    {
      -- select previous suggestion item
      "<c-l>",
      function()
        return vim.snippet.active({ direction = 1 }) and vim.snippet.jump(1)
      end,
      silent = true,
      mode = { "i", "s" },
    },
    {
      -- select next suggestion item
      "<c-h>",
      function()
        return vim.snippet.active({ direction = -1 }) and vim.snippet.jump(-1)
      end,
      silent = true,
      mode = { "i", "s" },
    },
  },
}
