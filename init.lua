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

vim.opt.guicursor = {
	"n-v-c:block",
	"i-ci-ve:ver25",
	"r-cr:hor20",
	"o:hor50",
}
