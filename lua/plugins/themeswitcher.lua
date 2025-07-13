local M = {}

local theme_file = vim.fn.stdpath("config") .. "/colorscheme.txt"

-- Сохраняем текущую тему
local function save_theme(name)
	local f = io.open(theme_file, "w")
	if f then
		f:write(name)
		f:close()
	end
end

-- Загружаем тему при запуске
function M.load_theme()
	local f = io.open(theme_file, "r")
	if f then
		local name = f:read("*l")
		f:close()
		if name and name ~= "" then
			local ok = pcall(vim.cmd.colorscheme, name)
			if not ok then
				vim.notify("⚠️ Failed to load saved theme: " .. name, vim.log.levels.ERROR)
			end
		end
	end
end

-- Выбор темы с предпросмотром
function M.switch_theme()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local previewers = require("telescope.previewers")

	local themes = vim.fn.getcompletion("", "color")
	local current_theme = vim.g.colors_name or ""

	pickers
		.new({}, {
			prompt_title = "🌈 Choose Colorscheme",
			finder = finders.new_table({ results = themes }),
			sorter = conf.generic_sorter({}),
			previewer = previewers.new_buffer_previewer({
				define_preview = function(_, entry)
					local theme = entry.value
					if theme then
						vim.schedule(function()
							pcall(vim.cmd.colorscheme, theme)
						end)
					end
				end,
			}),
			attach_mappings = function(_, map)
				map("i", "<CR>", function(bufnr)
					local selection = action_state.get_selected_entry()
					if selection then
						local theme = selection[1]
						vim.cmd.colorscheme(theme)
						save_theme(theme)
						vim.notify("🎨 Theme set to: " .. theme, vim.log.levels.INFO)
					end
					actions.close(bufnr)
				end)

				map("i", "<Esc>", function(bufnr)
					if current_theme ~= "" then
						vim.cmd.colorscheme(current_theme)
					end
					actions.close(bufnr)
				end)

				return true
			end,
		})
		:find()
end

return M
