return {
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
    enabled = true,
    opts = {
      provider = "custom",
      providers = {
        dashscope = {
          -- aliyun models: https://cloud.siliconflow.cn/me/models
          __inherited_from = "openai",
          api_key_name = "ALIYUNCS_API_KEY",
          endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
          model = "qwen2.5-3b-instruct",
        },
        zhipu = {
          -- zhipu models: https://console.zhipu.com/console/models
          __inherited_from = "openai",
          api_key_name = "BIGMODEL_API_KEY",
          endpoint = "https://open.bigmodel.cn/api/paas/v4",
          model = "glm-4.5-flash",
        },
      },
      behaviour = {
        enable_token_counting = true,
      },
    },
  },
}
