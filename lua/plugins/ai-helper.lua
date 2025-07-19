-------------------------------------------------------------------
--- https://github.com/yetone/avante.nvim
--- https://github.com/olimorris/codecompanion.nvim
-------------------------------------------------------------------
return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>a", group = "ai helper" },
      },
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    enabled = true,
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        -- render markdown contents in avante buffer
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "Avante" },
        },
        ft = { "Avante" },
      },
    },
    opts = {
      provider = "qwen",
      providers = {
        qwen = {
          __inherited_from = "openai",
          api_key_name = "ALIYUNCS_API_KEY", -- use system environment variable
          endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
          model = "qwen2.5-coder-3b-instruct",
          -- qwen2.5-coder-1.5b-instruct
          -- qwen2.5-coder-0.5b-instruct
          -- qwen2.5-coder-1.5b-instruct
          -- qwen2.5-coder-3b-instruct
          -- more infomation see:
          -- https://help.aliyun.com/zh/model-studio/getting-started/models
        },
      },
      behaviour = {
        auto_set_keymaps = true,
        enable_token_counting = true,
      },
    },
  },
}
