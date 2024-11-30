vim.cmd("let mapleader = ' '")

require("preferences")
require("installing-lazy")
require("keymaps")
require("icons").setup()

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	nested = true,
	callback = function()
		vim.cmd.colorscheme(vim.g.SCHEME)
	end,
})

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	callback = function(params)
		vim.g.SCHEME = params.match
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
