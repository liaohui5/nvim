-- integrated rustfmt, dprint formatter to conform
-- lazyvim : http://www.lazyvim.org/plugins/formatting
-- conform : https://github.com/stevearc/conform.nvim
-- prettier: https://prettier.io/docs/en/
-- extends for biome: https://github1s.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/formatting/biome.lua
local supported = {
  "html",
  "handlebars",
  "less",
  "scss",
  "markdown",
  "markdown.mdx",
  "yaml",
  -- "jsonc",
}

return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters = opts.formatters or {}
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    for _, ft in ipairs(supported) do
      opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
      table.insert(opts.formatters_by_ft[ft], "prettier")
    end

    -- dprint rules: https://dprint.dev/plugins/
    opts.formatters = opts.formatters or {}
    opts.formatters.prettier = {
      require_cwd = true,
    }
  end,
}
