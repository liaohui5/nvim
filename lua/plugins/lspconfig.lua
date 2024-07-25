return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          "<leader>r",
          group = "lsp",
          desc = "lsp",
          icon = { icon = "󰒋" },
        },
      },
    },
  },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    table.insert(keys, {
      "<leader>rn",
      "<leader>cr",
      desc = "Rename Symbol",
      mode = { "n", "v" },
      remap = true,
      silent = true,
    })

    -- restart lsp server
    table.insert(keys, {
      "<leader>rs",
      function()
        local options = {}
        local prompt_options = {
          prompt = "Select LSP server to restart",
        }
        local lsp_servers = vim.lsp.get_clients()
        for _, server in ipairs(lsp_servers) do
          table.insert(options, server.config.name)
        end

        vim.ui.select(options, prompt_options, function(choice)
          vim.cmd("LspRestart " .. choice)
        end)
      end,
      desc = "Restart LSP Server",
      mode = "n",
    })
  end,
  opts = {
    inlay_hints = {
      enabled = false,
    },
    servers = {
      emmet_language_server = {
        -- better html/css support
        filetypes = {
          "html",
          "css",
          "less",
          "sass",
          "scss",
          "pug",
          "vue",
          "javascriptreact",
          "typescriptreact",
        },
      },
    },
  },
}
