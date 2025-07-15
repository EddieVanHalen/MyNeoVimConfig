vim.o.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.o.ttyfast = true
vim.o.scrolloff = 30
vim.cmd("filetype plugin indent on")
vim.o.expandtab = true -- Превращать TAB в пробелы
vim.o.shiftwidth = 4 -- Отступ при автоформатировании = 4 пробела
vim.o.tabstop = 4 -- Визуальный размер TAB = 4 пробела
vim.o.softtabstop = 4 -- Кол-во пробелов при нажатии TAB = 4
vim.o.smarttab = true -- TAB учитывает shiftwidth
vim.opt.cursorline = true
vim.cmd([[highlight CursorLine guibg=#2e2e2e]])

vim.o.termguicolors = true

vim.wo.relativenumber = true

-- Dynamic statusline visibility for NvimTree
vim.api.nvim_create_autocmd("WinEnter", {
	callback = function()
		local ft = vim.bo[vim.api.nvim_get_current_buf()].filetype
		if ft == "NvimTree" then
			vim.opt.laststatus = 0
		else
			vim.opt.laststatus = 3
		end
	end,
})

vim.o.number = true
vim.o.relativenumber = true

-- ✨ Highlight yanked text for instant feedback
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
	end,
})

-- 🌙 Dim inactive windows for focus
vim.api.nvim_create_autocmd({ "WinEnter", "WinLeave" }, {
	callback = function(args)
		if vim.api.nvim_get_current_win() == args.win then
			vim.wo.winblend = 0
		else
			vim.wo.winblend = 20
		end
	end,
})

-- 🕒 Show time in the command area every minute
vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*",
	callback = function()
		vim.api.nvim_echo({ { "🕒 " .. os.date("%H:%M"), "Comment" } }, false, {})
	end,
})
