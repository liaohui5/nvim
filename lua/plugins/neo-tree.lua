------------------------------------------------------------------------------------------------
-- find more info about neo-tree.nvim
-- docs: https://github.com/nvim-neo-tree/neo-tree.nvim
-- default: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua
------------------------------------------------------------------------------------------------
return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "VeryLazy",
  opts = {
    close_if_last_window = true,
    hide_root_node = true,
    default_component_configs = {
      indent = {
        with_expanders = false,
        indent_size = 2,
        padding = 1,
        with_markers = true,
      },
    },
    -- event_handlers = {
    --   {
    --     -- open buffer when file created
    --     event = "file_added",
    --     handler = function(filepath)
    --       if vim.fn.filereadable(filepath) == 1 then
    --         vim.cmd("silent edit " .. filepath)
    --       end
    --     end,
    --   },
    --   {
    --     -- close buffer when file deleted
    --     event = "file_deleted",
    --     handler = function(filepath)
    --       local buf_ids = vim.api.nvim_list_bufs()
    --       local close_buf_cmd = "bdelete "
    --       for _, id in ipairs(buf_ids) do
    --         local buf_path = vim.fn.expand(vim.api.nvim_buf_get_name(id))
    --         if buf_path == filepath then
    --           close_buf_cmd = string.format(" %s %s", close_buf_cmd, id)
    --         end
    --       end
    --       vim.cmd(close_buf_cmd)
    --     end,
    --   },
    -- },
    filesystem = {
      filtered_items = {
        -- display all files
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
        never_show = { ".DS_Store" },
      },
      window = {
        width = 32,
        mappings = {
          -- See `:h neo-tree-mappings` for a list of built-in commands.
          ["d"] = "cut_to_clipboard",
          ["o"] = "open",
          ["<c-o>"] = {
            -- open file in macOS finder.app
            nowait = true,
            desc = "open file in Finder",
            command = function(state)
              local node = state.tree:get_node()
              local path = node.path
              if node.type == "file" then
                path = node._parent_id
              end
              vim.cmd("silent !open " .. path)
            end,
          },
          ["x"] = {
            -- move file to trash not delete from disk
            nowait = true,
            desc = "move file to trash",
            command = function(state)
              local node = state.tree:get_node()
              local strfmt = string.format
              local inputs = require("neo-tree.ui.inputs")
              local confirm_msg = strfmt("Are you sure to remove %s ?", node.name)
              inputs.confirm(confirm_msg, function(confirmed)
                if not confirmed then
                  return
                end
                -- move file to trash
                vim.cmd(strfmt("silent !mv %s ~/.Trash/", node.path))

                -- manual trigger file_deleted event
                local events = require("neo-tree.events")
                events.fire_event(events.FILE_DELETED, node.path)
              end)
            end,
          },
        },
      },
    },
  },
}
