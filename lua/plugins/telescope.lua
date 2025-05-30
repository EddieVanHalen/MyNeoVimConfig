require('telescope').setup{
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    sorting_strategy = "ascending",
    prompt_prefix = "🔍 ",
    selection_caret = " ",
  },
  pickers = {
    find_files = {
      hidden = true
    }
  }
}
