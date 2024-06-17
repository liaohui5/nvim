return {
  -- open url in browser
  "xiyaowong/link-visitor.nvim",
  event = "VeryLazy",
  dependencies = {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>o"] = {
          name = "+open",
        },
      },
    },
  },
  opts = {
    open_cmd = nil,
    silent = true,
    skip_confirmation = true,
  },
  keys = {
    {
      "<leader>ou",
      "<cmd>VisitLinkNearCursor<cr>",
      desc = "Open url in browser",
      mode = "n",
    },
    {
      "<leader>oU",
      "<cmd>VisitLinkInBuffer<cr>",
      desc = "Open buffer urls in browser",
      mode = "n",
    },
    {
      "<leader>od",
      function()
        require("link-visitor").visit("https://www.lazyvim.org/")
      end,
      desc = "Open LazyVIM Documention",
      mode = "n",
    },
    {
      "<leader>ok",
      function()
        require("link-visitor").visit("https://www.lazyvim.org/keymaps")
      end,
      desc = "Open LazyVIM keymaps",
      mode = "n",
    },
    {
      "<leader>ov",
      function()
        if vim.fn.executable("code") then
          vim.cmd("silent !code " .. vim.fn.expand("%p"))
        else
          print("please install vscode first")
        end
      end,
      desc = "Open buffer in vscode",
      mode = "n",
    },
    {
      "<leader>oV",
      function()
        if vim.fn.executable("code") then
          vim.cmd("silent !code " .. vim.fn.getcwd())
        else
          print("please install vscode first")
        end
      end,
      desc = "Open project in vscode",
      mode = "n",
    },
  },
}
