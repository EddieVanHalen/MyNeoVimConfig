-- require("nvim-tree").setup({
--   view = {
--     width = 32,
--     side = "left",
--     preserve_window_proportions = true,
--     signcolumn = "yes",
--   },
--   renderer = {
--     highlight_git = true,
--     highlight_opened_files = "all",
--     root_folder_label = ":t",
--     indent_markers = {
--       enable = true,
--       inline_arrows = true,
--       icons = {
--         corner = "└ ",
--         edge = "│ ",
--         item = "│ ",
--         none = "  ",
--       },
--     },
--     icons = {
--       show = {
--         file = false,
--         folder = false,
--         folder_arrow = true,
--         git = false,
--       },
--     },
--   },
--   filters = {
--     dotfiles = false,
--     git_clean = false,
--     no_buffer = false,
--     custom = { "^node_modules$", "^__pycache__$", "^obj$", "^bin$"},
--   },
--   update_focused_file = {
--     enable = true,
--     update_root = true,
--     ignore_list = {},
--   },
--   git = {
--     enable = true,
--   },
--   actions = {
--     open_file = {
--       quit_on_open = false,
--       resize_window = true,
--     },
--   },
require("nvim-tree").setup({
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
      },
    },
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    dotfiles = false,
    custom = { "^node_modules$", "^__pycache__$" },
  },
})
