require("neo-tree").setup({
	window = {
		position = "left",
		width = 30,
	},

	filesystem = {
		filtered_items = {
			visible = true, -- Показывать скрытые файлы
			hide_dotfiles = false, -- Не скрывать dot-файлы (начинающиеся с .)
			hide_gitignored = false, -- Не скрывать игнорируемые Git'ом
			hide_by_name = {
				"node_modules",
				"__pycache__",
			},
		},
	},

	default_component_configs = {
		icon = {
			folder_closed = "",
			folder_open = "",
			default = "",
			highlight = "NeoTreeFileIcon",
		},
		indent = {
			with_markers = true,
		},
	},

	renderers = {
		directory = {
			{ "indent" },
			{ "icon" },
			{ "name" },
		},
		file = {
			{ "indent" },
			{ "icon" },
			{ "name" },
		},
	},
})
