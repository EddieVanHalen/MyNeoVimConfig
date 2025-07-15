local lsp_progress = require("lsp-progress").progress

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },      -- diagonal separators
		section_separators = { left = "", right = "" },        -- diagonal section separators
		disabled_filetypes = { statusline = {}, winbar = {} },
		always_divide_middle = false,
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			function()
				return vim.bo.filetype == "NvimTree" and " " or " " .. vim.fn.mode()
			end,
		},
		lualine_b = {
			function()
				return vim.bo.filetype == "NvimTree" and " " or " " .. (vim.fn["FugitiveHead"]() or "")
			end,
		},
		lualine_c = {
			function()
				return vim.bo.filetype == "NvimTree" and " " or "%f"
			end,
			lsp_progress,
		},
		lualine_x = {
			function()
				return vim.bo.filetype == "NvimTree" and " " or vim.bo.filetype
			end,
		},
		lualine_y = {
			function()
				return vim.bo.filetype == "NvimTree" and " " or "%p%%"
			end,
		},
		lualine_z = {
			function()
				return vim.bo.filetype == "NvimTree" and " " or "%l:%c"
			end,
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

local lsp_progress = require("lsp-progress").progress

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },      -- diagonal separators
		section_separators = { left = "", right = "" },        -- diagonal section separators
		disabled_filetypes = { statusline = {}, winbar = {} },
		always_divide_middle = false,
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			function()
				return vim.bo.filetype == "NvimTree" and " " or " " .. vim.fn.mode()
			end,
		},
		lualine_b = {
			function()
				return vim.bo.filetype == "NvimTree" and " " or " " .. (vim.fn["FugitiveHead"]() or "")
			end,
		},
		lualine_c = {
			function()
				return vim.bo.filetype == "NvimTree" and " " or "%f"
			end,
			lsp_progress,
		},
		lualine_x = {
			function()
				return vim.bo.filetype == "NvimTree" and " " or vim.bo.filetype
			end,
		},
		lualine_y = {
			function()
				return vim.bo.filetype == "NvimTree" and " " or "%p%%"
			end,
		},
		lualine_z = {
			function()
				return vim.bo.filetype == "NvimTree" and " " or "%l:%c"
			end,
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
