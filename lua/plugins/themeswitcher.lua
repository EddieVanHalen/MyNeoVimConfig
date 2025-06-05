local M = {}

local themes = {
	"kanagawa",
	"catppuccin",
	"tokyonight",
	"gruvbox",
	"rose-pine",
	"onedark",
	"gruber-darker",
}

-- 📁 Путь до файла, где будет храниться имя темы
local theme_file = vim.fn.stdpath("config") .. "/colorscheme.txt"

-- 💾 Сохраняем имя выбранной темы
local function save_theme(name)
	local f = io.open(theme_file, "w")
	if f then
		f:write(name)
		f:close()
	end
end

-- 🧠 Загружаем имя темы из файла
function M.load_theme()
	local f = io.open(theme_file, "r")
	if f then
		local name = f:read("*l")
		f:close()
		if name then
			vim.cmd.colorscheme(name)
		end
	end
end

-- 🎨 Переключатель тем через Telescope
function M.switch_theme()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	pickers
		.new({}, {
			prompt_title = "🌈 Choose Colorscheme",
			finder = finders.new_table({
				results = themes,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(_, map)
				map("i", "<CR>", function(bufnr)
					local selection = action_state.get_selected_entry()
					actions.close(bufnr)
					vim.cmd.colorscheme(selection[1])
					save_theme(selection[1])
					vim.notify("Colorscheme set to " .. selection[1], vim.log.levels.INFO)
				end)
				return true
			end,
		})
		:find()
end

return M
