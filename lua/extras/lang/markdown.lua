-- https://www.lazyvim.org/extras/lang/markdown
return {
  {
    "williamboman/mason.nvim",
    opts = {
      -- not lint markdown syntax
      ensure_installed = { "markdown-toc" },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
}
