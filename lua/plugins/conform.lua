require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    rust = { "rustfmt" },
    csharp = { "csharpier" },
    python = { "black" },
    c = {"clang-format"},
    cpp = {"clang-format"},
  },

  format_on_save = function(bufnr)
    local max_lines = 1000
    if vim.api.nvim_buf_line_count(bufnr) < max_lines then
      return { lsp_fallback = true }
    end
  end,
})
