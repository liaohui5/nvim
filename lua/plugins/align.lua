-- https://github.com/Vonr/align.nvim
return {
  "Vonr/align.nvim",
  event = "VeryLazy",
  branch = "v2",
  keys = {
    {
      "ga",
      function()
        require("align").align_to_string({
          preview = true,
          regex = false,
        })
      end,
      desc = "align lines by string",
      mode = "x",
    },
  },
}
