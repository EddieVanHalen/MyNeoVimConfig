return {
	{
		"williamboman/mason.nvim",

		config = function()
			require("mason").setup()
		end,
	},

	{
		"neovim/nvim-lspconfig",

		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local border = {
				{ "🭽", "FloatBorder" },
				{ "▔", "FloatBorder" },
				{ "🭾", "FloatBorder" },
				{ "▕", "FloatBorder" },
				{ "🭿", "FloatBorder" },
				{ "▁", "FloatBorder" },
				{ "🭼", "FloatBorder" },
				{ "▏", "FloatBorder" },
			}

			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or border
				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},

				capabilities = capabilities,
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
		end,
	},
}