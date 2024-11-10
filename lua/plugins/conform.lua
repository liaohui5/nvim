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
        "rustfmt",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}

      -- dprint rules: https://dprint.dev/plugins/
      opts.formatters_by_ft.vue = {
        "dprint",
        lsp_format = "fallback",
      }
      opts.formatters.dprint = {
        condition = function(ctx)
          -- if dprint.json exists
          return vim.fs.find({ "dprint.json", ".dprint.json" }, { path = ctx.filename, upward = true })[1]
        end,
      }

      -- rustfmt rules: https://rust-lang.github.io/rustfmt/
      opts.formatters_by_ft.rust = {
        "rustfmt",
        lsp_format = "fallback",
      }
      opts.formatters.rustfmt = {
        condition = function(ctx)
          -- if rustfmt.toml exists
          return vim.fs.find({ "rustfmt.toml", ".rustfmt.toml" }, {
            path = ctx.filename,
            upward = true,
          })[1]
        end,
      }
    end,
  },
}
