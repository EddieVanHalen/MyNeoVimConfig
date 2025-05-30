require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "kanagawa",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      function()
        return vim.bo.filetype == "NvimTree" and " " or " " .. vim.fn.mode()
      end,
    },
    lualine_b = {
      function()
        return vim.bo.filetype == "NvimTree" and " " or " " .. (vim.fn["FugitiveHead"]() or "")
      end,
    },
    lualine_c = {
      function()
        return vim.bo.filetype == "NvimTree" and " " or "%f"
      end,
    },
    lualine_x = {
      function()
        return vim.bo.filetype == "NvimTree" and " " or vim.bo.filetype
      end,
    },
    lualine_y = {
      function()
        return vim.bo.filetype == "NvimTree" and " " or "%p%%"
      end,
    },
    lualine_z = {
      function()
        return vim.bo.filetype == "NvimTree" and " " or "%l:%c"
      end,
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
})
