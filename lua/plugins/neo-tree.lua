return {
  "neo-tree.nvim",
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
    filesystem = {
      filtered_items = {
        -- display all files
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
    },
    source_selector = {
      winbar = false,
    },
  },
}
