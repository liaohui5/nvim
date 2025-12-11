return {
  {
    "folke/sidekick.nvim",
    opts = {
      -- https://github1s.com/folke/sidekick.nvim/blob/HEAD/lua/sidekick/config.lua
      -- always show upgrade message:
      -- you've reached your monthly code completion limit. upgrade your plan to copilot pro
      nes = {
        enabled = false,
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = {
      file_types = { "Avante" },
    },
    ft = { "Avante" },
  },
  {
    -- docs: https://github.com/yetone/avante.nvim
    "yetone/avante.nvim",
    enabled = false, -- BUG: https://github.com/yetone/avante.nvim/issues/612
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
        enable_token_counting = true,
      },
    },
  },
}
