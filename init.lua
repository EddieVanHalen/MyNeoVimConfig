vim.o.clipboard = 'unnamedplus'
vim.g.mapleader = " "
vim.o.ttyfast = true
vim.o.scrolloff = 30
vim.cmd('filetype plugin indent on')
vim.o.expandtab = true      -- Превращать TAB в пробелы
vim.o.shiftwidth = 4        -- Отступ при автоформатировании = 4 пробела
vim.o.tabstop = 4           -- Визуальный размер TAB = 4 пробела
vim.o.softtabstop = 4       -- Кол-во пробелов при нажатии TAB = 4
vim.o.smarttab = true       -- TAB учитывает shiftwidth
vim.opt.cursorline = true
vim.cmd [[highlight CursorLine guibg=#2e2e2e]]


vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  callback = function()
    vim.wo.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    vim.wo.relativenumber = true
  end,
})

vim.o.number = true
vim.o.relativenumber = true

-- Установка плагинов через vim-plug
vim.cmd [[
  call plug#begin('~/.config/nvim/plugged')

  Plug 'rebelot/kanagawa.nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'blazkowolf/gruber-darker.nvim'
  Plug 'elvessousa/sobrio'  
  Plug 'nvim-lua/plenary.nvim'               
  Plug 'nvim-telescope/telescope.nvim'       
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'ayu-theme/ayu-vim'
  Plug 'ajmwagar/vim-deus'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'nvim-tree/nvim-web-devicons'         " Иконки для файлов
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'windwp/nvim-autopairs'

  call plug#end()
]]



require("nvim-autopairs").setup()

-- Цветовая схема
vim.o.termguicolors = true
vim.cmd[[colorscheme kanagawa-wave]]

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c_sharp", "javascript", "lua", "python", "cpp", "c", "rust"},
  highlight = {
    enable = true,  -- Включить подсветку синтаксиса
  },
}

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


-- Настройки nvim-tree
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


-- <Space>ff — найти файл
vim.keymap.set('n', '<Space>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })

-- <Space>fg — поиск по содержимому
vim.keymap.set('n', '<Space>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- <Space>fb — открыть буферы
vim.keymap.set('n', '<Space>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })

-- <Space>fh — поиск справки
vim.keymap.set('n', '<Space>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })


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

vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Настройки Airline
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline_powerline_fonts'] = 1
vim.g['airline_statusline_ontop'] = 0
vim.g['airline_theme'] = 'atomic'
vim.g['airline#extensions#tabline#formatter'] = 'default'


-- COC: биндинги для автодополнения
vim.keymap.set("i", "<Tab>", [[coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"]], {
  noremap = true,
  silent = true,
  expr = true
})

vim.keymap.set("i", "<S-Tab>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], {
  noremap = true,
  silent = true,
  expr = true
})

vim.keymap.set("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]], {
  noremap = true,
  silent = true,
  expr = true
})

-- CoC: полезные биндинги в normal mode
vim.keymap.set("n", "K", "<Cmd>call CocActionAsync('doHover')<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {})

vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {})
vim.keymap.set("n", "<leader>f", "<Cmd>call CocAction('format')<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ac", "<Cmd>call CocActionAsync('codeAction')<CR>", { noremap = true, silent = true })

-- Диагностика
-- vim.keymap.set("n", "<leader>e", ":CocList diagnostics<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {})
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {})


