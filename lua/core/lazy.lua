local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-tree/nvim-tree.lua" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "windwp/nvim-autopairs" },
	{ "nvim-lualine/lualine.nvim" },

	-- THEMES

	{ "rebelot/kanagawa.nvim" },
	{ "blazkowolf/gruber-darker.nvim" },
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "folke/tokyonight.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "rose-pine/neovim" },
	{ "navarasu/onedark.nvim" },

	-- FORMATTER
	{
		"stevearc/conform.nvim",
		opts = {},
	},

	-- LSP

	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
}, {})
