require("neo-tree").setup({
	window = {
		position = "left",
		width = 32,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
	},

	filesystem = {
		filtered_items = {
			visible = true, -- Show hidden files
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_by_name = {
				"node_modules",
				"__pycache__",
			},
		},
		follow_current_file = { enabled = true }, -- auto reveal
		group_empty_dirs = true,
	},

	default_component_configs = {
		indent = {
			with_markers = true,
			indent_size = 2,
			padding = 1,
			with_expanders = true,
			expander_collapsed = "",
			expander_expanded = "",
			highlight = "NeoTreeIndentMarker",
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				added     = "✚",
				modified  = "",
				deleted   = "✖",
				renamed   = "➜",
				untracked = "★",
				ignored   = "◌",
				unstaged  = "✗",
				staged    = "✓",
				conflict  = "",
			},
		},
	},

	renderers = {
		directory = {
			{ "indent" },
			{ "name", highlight = "Directory" },
		},
		file = {
			{ "indent" },
			{ "name" },
		},
	},

	enable_git_status = true,
	enable_diagnostics = true,
})
