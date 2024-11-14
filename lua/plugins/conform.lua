-- integrated rustfmt, dprint formatter to conform
-- lazyvim: http://www.lazyvim.org/plugins/formatting
-- conform: https://github.com/stevearc/conform.nvim
-- dprint : https://dprint.dev/
-- rustfmt: https://github.com/rust-lang/rustfmt
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "dprint",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}

      local fts = {
        "html",
        "vue",
        "javascript",
        "typescript",
        "json",
        "rust",
        "toml",
        "yaml",
        "Dockerfile",
        "python",
        "css",
        "less",
        "scss",
        "sass",
      }

      for _, ft in ipairs(fts) do
        opts.formatters_by_ft[ft] = {
          "dprint",
          lsp_format = "fallback",
        }
      end

      -- dprint rules: https://dprint.dev/plugins/
      opts.formatters.dprint = {
        condition = function(ctx)
          -- if dprint.json exists
          return vim.fs.find({ "dprint.json", ".dprint.json" }, { path = ctx.filename, upward = true })[1]
        end,
      }
    end,
  },
}
