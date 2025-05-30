require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c_sharp", "javascript", "lua", "python", "cpp", "c", "rust"},
  highlight = {
    enable = true,  -- Включить подсветку синтаксиса
  },
}
