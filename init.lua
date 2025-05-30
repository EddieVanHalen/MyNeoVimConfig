require("core.options")
require("core.keymaps")
require("core.lazy")

require("plugins.nvimtree")
require("plugins.treesitter")
require("plugins.autopairs")
require("plugins.telescope")
require("plugins.theme")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.conform")
require("plugins.lualine")

-- vim.cmd [[
--   call plug#begin('~/.config/nvim/plugged')
--
--   Plug 'rebelot/kanagawa.nvim'
--   Plug 'blazkowolf/gruber-darker.nvim'
--   Plug 'elvessousa/sobrio'  
--   Plug 'nvim-lua/plenary.nvim'               
--   Plug 'nvim-telescope/telescope.nvim'       
--   Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
--   Plug 'ayu-theme/ayu-vim'
--   Plug 'ajmwagar/vim-deus'
--   Plug 'nvim-tree/nvim-tree.lua'
--   Plug 'nvim-tree/nvim-web-devicons'         " Иконки для файлов
--   Plug 'vim-airline/vim-airline'
--   Plug 'vim-airline/vim-airline-themes'
--   Plug 'windwp/nvim-autopairs'
--
--   call plug#end()
-- ]]
--
--
--
--
--

--
--
--
-- -- Настройки Airline
-- vim.g['airline#extensions#tabline#enabled'] = 1
-- vim.g['airline_powerline_fonts'] = 1
-- vim.g['airline_statusline_ontop'] = 0
-- vim.g['airline_theme'] = 'atomic'
-- vim.g['airline#extensions#tabline#formatter'] = 'default'
