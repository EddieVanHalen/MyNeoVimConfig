require("nvim-tree").setup({
  view = {
    width = 32,
    side = "left",
    preserve_window_proportions = true,
    signcolumn = "yes",
  },
  renderer = {
    highlight_git = true,
    highlight_opened_files = "all",
    root_folder_label = ":t",
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        item = "│ ",
        none = "  ",
      },
    },
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  filters = {
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    custom = { "^node_modules$", "^__pycache__$", "^obj$", "^bin$"},
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = {},
  },
  git = {
    enable = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = true,
    },
  },
})
