-- add dprint formatter config in conform
-- lazyvim: http://www.lazyvim.org/plugins/formatting
-- dprint : https://dprint.dev/
-- conform: https://github.com/stevearc/conform.nvim
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "dprint" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}
      opts.formatters.dprint = {
        condition = function(ctx)
          -- if dprint.json exists
          return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        end,
      }
    end,
  },
}
