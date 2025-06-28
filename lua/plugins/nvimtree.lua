require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			visible = true, -- показывать скрытые файлы
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_by_name = {
				"node_modules",
				"__pycache__",
			},
		},
	},
	window = {
		position = "left",
		width = 30,
	},
	renderers = {
		directory = {
			{ "indent" },
			{ "icon" }, -- ✅ добавь это, чтобы иконки папок отображались
			{ "name" },
		},
		file = {
			{ "indent" },
			{ "icon" }, -- ✅ и для файлов тоже
			{ "name" },
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
})
