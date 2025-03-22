------------------------------------------------------------------------------------------------
-- find more info about neo-tree.nvim
-- docs: https://github.com/nvim-neo-tree/neo-tree.nvim
-- default: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua
------------------------------------------------------------------------------------------------
return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    -- on rename file
    local function on_move(data)
      Snacks.rename.on_rename_file(data.source, data.destination)
    end
    local events = require("neo-tree.events")
    local event_handlers = {
      { event = events.FILE_MOVED, handler = on_move },
      { event = events.FILE_RENAMED, handler = on_move },
      {
        -- open buffer when file created
        event = "file_added",
        handler = function(filepath)
          if vim.fn.filereadable(filepath) == 1 then
            vim.cmd("silent edit " .. filepath)
          end
        end,
      },
      {
        -- close buffer when file deleted
        event = "file_deleted",
        handler = function(filepath)
          local buf_ids = vim.api.nvim_list_bufs()
          for _, id in ipairs(buf_ids) do
            local buf_path = vim.fn.expand(vim.api.nvim_buf_get_name(id))
            if buf_path == filepath then
              Snacks.bufdelete(id)
              break
            end
          end
        end,
      },
    }

    -- open file in macOS finder.app
    local function open_in_finder(state)
      local node = state.tree:get_node()
      local path = node.path
      if node.type == "file" then
        path = node._parent_id
      end
      vim.cmd("silent !open " .. path)
    end

    -- move file to trash not delete from disk
    local function soft_delete(state)
      local node = state.tree:get_node()
      local strfmt = string.format
      local inputs = require("neo-tree.ui.inputs")
      local confirm_msg = strfmt("Are you sure to remove %s ?", node.name)
      inputs.confirm(confirm_msg, function(confirmed)
        if not confirmed then
          return
        end
        -- move file to trash & trigger file_deleted event
        -- local events = require("neo-tree.events")
        vim.cmd(strfmt("silent !mv %s ~/.Trash/", node.path))
        events.fire_event(events.FILE_DELETED, node.path)
      end)
    end

    return vim.tbl_deep_extend("force", opts, {
      event_handlers = event_handlers,
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
            -- `:h neo-tree-mappings` show more default keybindings
            ["d"] = "cut_to_clipboard",
            ["o"] = "open",
            ["<c-o>"] = {
              nowait = true,
              desc = "open file in Finder",
              command = open_in_finder,
            },
            ["x"] = {
              nowait = true,
              desc = "move file to trash",
              command = soft_delete,
            },
          },
        },
      },
    })
  end,
}
