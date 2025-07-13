-- local lsp_progress = require("lsp-progress").progress
--
-- require("lualine").setup({
-- 	options = {
-- 		theme = {
-- 			normal = {
-- 				a = { fg = "#000000", bg = "#ffdd33", gui = "bold" },
-- 				b = { fg = "#ffffff", bg = "#444444" },
-- 				c = { fg = "#bbbbbb", bg = "#262626" },
-- 			},
-- 			insert = {
-- 				a = { fg = "#000000", bg = "#99cc33", gui = "bold" },
-- 			},
-- 			visual = {
-- 				a = { fg = "#000000", bg = "#ff6600", gui = "bold" },
-- 			},
-- 			replace = {
-- 				a = { fg = "#000000", bg = "#cc3333", gui = "bold" },
-- 			},
-- 			inactive = {
-- 				a = { fg = "#aaaaaa", bg = "#1c1c1c" },
-- 				b = { fg = "#aaaaaa", bg = "#1c1c1c" },
-- 				c = { fg = "#666666", bg = "#1c1c1c" },
-- 			},
-- 		},
-- 	},
-- 	sections = {
-- 		lualine_a = {
-- 			function()
-- 				return vim.bo.filetype == "NvimTree" and " " or " " .. vim.fn.mode()
-- 			end,
-- 		},
-- 		lualine_b = {
-- 			function()
-- 				return vim.bo.filetype == "NvimTree" and " " or " " .. (vim.fn["FugitiveHead"]() or "")
-- 			end,
-- 		},
-- 		lualine_c = {
-- 			function()
-- 				return vim.bo.filetype == "NvimTree" and " " or "%f"
-- 			end,
-- 			lsp_progress, -- 👈 вот это добавляем
-- 		},
-- 		lualine_x = {
-- 			function()
-- 				return vim.bo.filetype == "NvimTree" and " " or vim.bo.filetype
-- 			end,
-- 		},
-- 		lualine_y = {
-- 			function()
-- 				return vim.bo.filetype == "NvimTree" and " " or "%p%%"
-- 			end,
-- 		},
-- 		lualine_z = {
-- 			function()
-- 				return vim.bo.filetype == "NvimTree" and " " or "%l:%c"
-- 			end,
-- 		},
-- 	},
-- 	inactive_sections = {
-- 		lualine_a = {},
-- 		lualine_b = {},
-- 		lualine_c = { "filename" },
-- 		lualine_x = { "location" },
-- 		lualine_y = {},
-- 		lualine_z = {},
-- 	},
-- })
--
-- local lsp_progress = require("lsp-progress").progress
--
-- require("lualine").setup({
-- 	options = {
-- 		theme = {
-- 			normal = {
-- 				a = { fg = "#1F1F28", bg = "#DCA561", gui = "bold" }, -- peach
-- 				b = { fg = "#DCD7BA", bg = "#363646" },
-- 				c = { fg = "#C8C093", bg = "#223249" },
-- 			},
-- 			insert = {
-- 				a = { fg = "#1F1F28", bg = "#98BB6C", gui = "bold" }, -- green
-- 			},
-- 			visual = {
-- 				a = { fg = "#1F1F28", bg = "#957FB8", gui = "bold" }, -- lavender
-- 			},
-- 			replace = {
-- 				a = { fg = "#1F1F28", bg = "#E46876", gui = "bold" }, -- red
-- 			},
-- 			inactive = {
-- 				a = { fg = "#7E7E9E", bg = "#1F1F28" },
-- 				b = { fg = "#7E7E9E", bg = "#1F1F28" },
-- 				c = { fg = "#727169", bg = "#1F1F28" },
-- 			},
-- 		},
-- 	},
-- 	sections = {
-- 		lualine_a = {
-- 			function()
-- 				return vim.bo.filetype == "NvimTree" and " " or " " .. vim.fn.mode()
-- 			end,
-- 		},
-- 		lualine_b = {
-- 			function()
-- 				return vim.bo.filetype == "NvimTree" and " " or " " .. (vim.fn["FugitiveHead"]() or "")
-- 			end,
-- 		},
-- 		lualine_c = {
-- 			function()
-- 				return vim.bo.filetype == "NvimTree" and " " or "%f"
-- 			end,
-- 			lsp_progress,
-- 		},
-- 		lualine_x = {
-- 			function()
-- 				return vim.bo.filetype == "NvimTree" and " " or vim.bo.filetype
-- 			end,
-- 		},
-- 		lualine_y = {
-- 			function()
-- 				return vim.bo.filetype == "NvimTree" and " " or "%p%%"
-- 			end,
-- 		},
-- 		lualine_z = {
-- 			function()
-- 				return vim.bo.filetype == "NvimTree" and " " or "%l:%c"
-- 			end,
-- 		},
-- 	},
-- 	inactive_sections = {
-- 		lualine_a = {},
-- 		lualine_b = {},
-- 		lualine_c = { "filename" },
-- 		lualine_x = { "location" },
-- 		lualine_y = {},
-- 		lualine_z = {},
-- 	},
-- })

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16, -- ~60fps
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"Filetype",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
			},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
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
