require("core.options")
require("core.keymaps")
require("core.lazy")

require("plugins.nvimtree")
require("plugins.treesitter")
require("plugins.autopairs")
require("plugins.telescope")
require("plugins.theme")
require("plugins.cmp")
require("plugins.conform")
require("plugins.lualine")

-- Always use a wide block cursor in all modes (like classic Vim)
vim.opt.guicursor = { "a:block" }
