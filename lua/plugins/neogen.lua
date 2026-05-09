return {
  "danymat/neogen",
  event = "VeryLazy",
  enabled = true,
  cmd = "Neogen",
  keys = {
    {
      "<leader>cn",
      function()
        vim.ui.select(
          { "func", "class", "type", "file" },
          { prompt = "Select type to generate comment: " },
          function(choice)
            require("neogen").generate({ type = choice })
            -- vim.cmd("Neogen " .. choice)
          end
        )
      end,
      desc = "Generate Annotations (Neogen)",
    },
  },
}
