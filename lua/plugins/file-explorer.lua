------------------------------------------------------------------------------------------------
-- find more info about neo-tree.nvim
-- docs: https://github.com/nvim-tree/nvim-tree.lua
-- docs: https://github.com/nvim-neo-tree/neo-tree.nvim
-- default: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua
------------------------------------------------------------------------------------------------
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    event = "VeryLazy",
    keys = {
      {
        "<c-e>",
        "<leader>e",
        remap = true,
        mode = "n",
        desc = "Toggle NvimTree",
      },
    },
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

      -- copy file relative path to clipboard
      local function copy_relative_path(state)
        local node = state.tree:get_node()
        local absolute_path = node:get_id()
        local relative_path = vim.fn.fnamemodify(absolute_path, ":.")
        vim.fn.setreg("+", relative_path, "c")
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
              ["<c-enter>"] = {
                nowait = true,
                desc = "open file in Finder",
                command = open_in_finder,
              },
              ["x"] = {
                nowait = true,
                desc = "move file to trash",
                command = soft_delete,
              },
              ["<c-y>"] = {
                nowait = true,
                command = copy_relative_path,
                desc = "Copy Reltive Path to Clipboard",
              },
            },
          },
        },
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = "VeryLazy",
    enabled = true,
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function(_, opts)
      local on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local keyset = vim.keymap.set
        local function keyopts(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end
        -- https://github1s.com/nvim-tree/nvim-tree.lua/blob/master/lua/nvim-tree/keymap.lua
        -- stylua: ignore start
        keyset("n", "<c-e>",     "<cmd>NvimTreeToggle<cr>",        keyopts("Toggle NvimTree"))
        keyset("n", "=",         api.tree.change_root_to_node,     keyopts("CD"))
        keyset("n", "/",         api.node.show_info_popup,         keyopts("Info"))
        keyset("n", "<c-v>",     api.node.open.vertical,           keyopts("Open: Vertical Split"))
        keyset("n", "<c-x>",     api.node.open.horizontal,         keyopts("Open: Horizontal Split"))
        keyset("n", "<bs>",      api.node.navigate.parent_close,   keyopts("Close Directory"))
        keyset("n", "<cr>",      api.node.open.edit,               keyopts("Open"))
        keyset("n", "<tab>",     api.node.open.preview,            keyopts("Open Preview"))
        keyset("n", ".",         api.node.run.cmd,                 keyopts("Run Command"))
        keyset("n", "a",         api.fs.create,                    keyopts("Create File Or Directory"))
        keyset("n", "y",         api.fs.copy.node,                 keyopts("Copy"))
        keyset("n", "d",         api.fs.cut,                       keyopts("Cut"))
        keyset("n", "x",         api.fs.trash,                     keyopts("Trash"))
        keyset("n", "<shift-x>", api.fs.remove,                    keyopts("Delete"))
        keyset("n", "?",         api.tree.toggle_help,             keyopts("Help"))
        keyset("n", "<shift-y>", api.fs.copy.absolute_path,        keyopts("Copy Absolute Path"))
        keyset("n", "<c-y>",     api.fs.copy.relative_path,        keyopts("Copy Relative Path"))
        keyset("n", "l",         api.node.open.edit,               keyopts("Open"))
        keyset("n", "o",         api.node.open.edit,               keyopts("Open"))
        keyset("n", "<shift-o>", api.node.open.no_window_picker,   keyopts("Open: No Window Picker"))
        keyset("n", "p",         api.fs.paste,                     keyopts("Paste"))
        keyset("n", "q",         api.tree.close,                   keyopts("Close"))
        keyset("n", "u",         api.fs.rename_full,               keyopts("Rename: Full Path"))
        keyset("n", "r",         api.fs.rename,                    keyopts("Rename"))
        keyset("n", "<c-r>",     api.fs.rename_sub,                keyopts("Rename: Omit Filename"))
        keyset("n", "<shift-r>", api.tree.reload,                  keyopts("Refresh"))
        keyset("n", "<c-enter>", api.node.run.system,              keyopts("Run System"))
        keyset("n", "<shift-w>", api.tree.collapse_all,            keyopts("Collapse"))
        -- stylua: ignore end
      end
      local options = vim.tbl_deep_extend("force", opts, {
        on_attach = on_attach,
        sync_root_with_cwd = true,
        view = {
          cursorline = true,
          debounce_delay = 15,
          side = "left",
          signcolumn = "yes",
          width = 32,
        },
        renderer = {
          root_folder_label = false, -- hide root folder
          decorators = { "Open", "Hidden", "Bookmark", "Diagnostics", "Copied", "Cut" },
          indent_markers = {
            enable = true,
            inline_arrows = false,
          },
          icons = {
            show = {
              folder_arrow = false,
            },
          },
        },
        update_focused_file = {
          enable = true,
          exclude = false,
        },
        git = {
          enable = false,
        },
        filters = {
          enable = false,
        },
      })
      require("nvim-tree").setup(options)
    end,
    keys = {
      {
        "<c-e>",
        "<cmd>NvimTreeToggle<cr>",
        mode = "n",
        desc = "Toggle NvimTree",
      },
    },
  },
}
