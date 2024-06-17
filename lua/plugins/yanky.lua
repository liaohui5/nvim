return {
  "gbprod/yanky.nvim",
  keys = {
    { "<leader>p", false },
    {
      "<leader>pp",
      function()
        if LazyVim.pick.picker.name == "telescope" then
          require("telescope").extensions.yank_history.yank_history({})
        else
          vim.cmd([[YankyRingHistory]])
        end
      end,
      desc = "Open Yank History",
    },
  },
}
