-------------------------------------------------------------------
--- https://github.com/yetone/avante.nvim
--- https://github.com/olimorris/codecompanion.nvim
-------------------------------------------------------------------
return {
  {
    {
      "folke/which-key.nvim",
      optional = true,
      opts = {
        spec = {
          { "<leader>a", group = "ai helper" },
        },
      },
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        -- render markdown contents in avante buffer
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    opts = {
      provider = "openai",
      auto_suggestions_provider = "openai",
      openai = {
        endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
        model = "qwen2.5-coder-3b-instruct",
        timeout = 30000, -- timeout in ms
        temperature = 0,
        max_tokens = 4096,
      },
    },
  },
}
