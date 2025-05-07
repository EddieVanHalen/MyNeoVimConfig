vim.o.clipboard = 'unnamedplus'
vim.o.ttyfast = true
vim.o.scrolloff = 30
vim.cmd('filetype plugin indent on')

-- Установка плагинов через vim-plug
vim.cmd [[
  call plug#begin('~/.config/nvim/plugged')

  Plug 'sheerun/vim-polyglot'
  Plug 'ayu-theme/ayu-vim'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'nvim-tree/nvim-web-devicons'         " Иконки для файлов
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  call plug#end()
]]

-- Цветовая схема
vim.o.termguicolors = true
vim.cmd[[colorscheme ayu]]


-- Настройки nvim-tree
require("nvim-tree").setup({
  view = {
    width = 30,
    side = "left"
  },
  renderer = {
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
    custom = { "^node_modules$", "^__pycache__$" }
  }
})

-- Клавиша для открытия/закрытия дерева
--vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Открытие/закрытие nvim-tree с Space + n
vim.keymap.set('n', '<Space>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Фокусировка на nvim-tree с Space + e
vim.keymap.set('n', '<Space>e', ':NvimTreeFocus<CR>', { noremap = true, silent = true })

-- Переключение фокуса обратно на редактор с Space + r
vim.keymap.set('n', '<Space>r', ':wincmd p<CR>', { noremap = true, silent = true })


-- Автоматическое открытие дерева при запуске, если это директория
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local directory = vim.fn.argv(0)
    if vim.fn.isdirectory(directory) == 1 then
      vim.cmd("NvimTreeOpen")
    end
  end
})

-- Настройки Airline
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline_powerline_fonts'] = 1
vim.g['airline_statusline_ontop'] = 0
vim.g['airline_theme'] = 'ayu_dark'
vim.g['airline#extensions#tabline#formatter'] = 'default'

-- Настройки coc.nvim
vim.cmd [[
  " TAB для подтверждения автодополнения
  inoremap <silent><expr> <TAB> pumvisible() ? coc#pum#confirm() : "\<Tab>"
  " Shift-TAB — назад по списку
  inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
  " Enter — подтвердить выбор
  inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
]]

-- Команда для обновления Coc Extensions можно вызывать вручную
-- :CocInstall coc-clangd coc-pyright coc-json и т.д.

