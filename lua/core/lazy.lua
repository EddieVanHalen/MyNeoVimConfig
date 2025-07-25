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
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- иконки (можно отключить)
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"linrongbin16/lsp-progress.nvim",
		config = function()
			require("lsp-progress").setup()
		end,
	},

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
	{ "rose-pine/neovim" },
	{ "navarasu/onedark.nvim" },
	{ "EdenEast/nightfox.nvim" },           -- Nightfox, Nordfox, etc.
	{ "shaunsingh/nord.nvim" },             -- Nord
	{ "sainnhe/everforest" },               -- Everforest
	{ "projekt0n/github-nvim-theme" },      -- GitHub themes
	{ "olimorris/onedarkpro.nvim" },        -- Onedark Pro
	{ "nyoom-engineering/oxocarbon.nvim" }, -- Oxocarbon

	-- FORMATTER
	{
		"stevearc/conform.nvim",
		opts = {},
	},

	-- LSP

	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
}, {})
