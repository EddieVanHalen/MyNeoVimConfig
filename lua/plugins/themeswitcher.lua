local M = {}

local theme_file = vim.fn.stdpath("config") .. "/colorscheme.txt"

-- Save current theme
local function save_theme(name)
    local f = io.open(theme_file, "w")
    if f then
        f:write(name)
        f:close()
    end
end

-- Load theme on startup
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

-- Theme switcher with preview
function M.switch_theme()
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local previewers = require("telescope.previewers")

    local themes = vim.fn.getcompletion("", "color")
    local current_theme = vim.g.colors_name or ""

    pickers.new({
        prompt_title = "🌈 Choose Colorscheme",
        results_title = "Available Themes",
        layout_strategy = "center",
        layout_config = {
            width = 0.5,
            height = 0.5,
            prompt_position = "top",
        },
        borderchars = {
            "━", "┃", "━", "┃", "┏", "┓", "┛", "┗",
        },
        winblend = 10,
    }, {
        finder = finders.new_table({
            results = themes,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = "🎨  " .. entry,
                    ordinal = entry,
                }
            end,
        }),
        sorter = conf.generic_sorter({}),
        previewer = previewers.new_buffer_previewer({
            define_preview = function(self, entry)
                -- Save the current theme only once
                if not self.state then self.state = {} end
                if not self.state.prev_theme then
                    self.state.prev_theme = vim.g.colors_name
                end
                local theme = entry.value
                if theme and theme ~= vim.g.colors_name then
                    pcall(vim.cmd.colorscheme, theme)
                end
            end,
            teardown = function(self)
                -- Restore previous theme when preview closes
                if self.state and self.state.prev_theme and self.state.prev_theme ~= vim.g.colors_name then
                    pcall(vim.cmd.colorscheme, self.state.prev_theme)
                end
            end,
        }),
        attach_mappings = function(_, map)
            map("i", "<CR>", function(bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    local theme = selection.value
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
    }):find()
end

return M
