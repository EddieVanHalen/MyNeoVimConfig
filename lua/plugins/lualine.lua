local lsp_progress = require("lsp-progress").progress

require("lualine").setup({
	options = {
		theme = {
			normal = {
				a = { fg = "#000000", bg = "#ffdd33", gui = "bold" },
				b = { fg = "#ffffff", bg = "#444444" },
				c = { fg = "#bbbbbb", bg = "#262626" },
			},
			insert = {
				a = { fg = "#000000", bg = "#99cc33", gui = "bold" },
			},
			visual = {
				a = { fg = "#000000", bg = "#ff6600", gui = "bold" },
			},
			replace = {
				a = { fg = "#000000", bg = "#cc3333", gui = "bold" },
			},
			inactive = {
				a = { fg = "#aaaaaa", bg = "#1c1c1c" },
				b = { fg = "#aaaaaa", bg = "#1c1c1c" },
				c = { fg = "#666666", bg = "#1c1c1c" },
			},
		},
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
			lsp_progress, -- 👈 вот это добавляем
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
})
