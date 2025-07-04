require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "rust_analyzer", "svelte", "ts_ls", "omnisharp", "clangd" },
	automatic_installation = true,
})

-- Общее on_attach
local on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	-- Навигация
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)

	-- Инфо
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)

	-- Диагностика
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, bufopts)

	-- Форматирование при сохранении, если поддерживается сервером
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = false }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Common Setup For All Lsps
local common_setup = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- svelte without formatting
require("lspconfig").svelte.setup(vim.tbl_extend("force", common_setup, {
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
	end,
}))

-- ts_ls without formatting
require("lspconfig").ts_ls.setup(vim.tbl_extend("force", common_setup, {
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
	end,
}))

-- rust_analyzer with settings
require("lspconfig").rust_analyzer.setup(vim.tbl_extend("force", common_setup, {
	settings = {
		["rust-analyzer"] = {
			checkOnSave = { command = "clippy" },
		},
	},
}))

-- clangd with cmd
require("lspconfig").clangd.setup(vim.tbl_extend("force", common_setup, {
	cmd = { "clangd" },
}))

-- omnisharp
require("lspconfig").omnisharp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "omnisharp" },
})
