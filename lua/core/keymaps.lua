-- <Space>ff — найти файл
vim.keymap.set("n", "<Space>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })

-- <Space>fg — поиск по содержимому
vim.keymap.set("n", "<Space>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })

-- <Space>fb — открыть буферы
vim.keymap.set("n", "<Space>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })

-- <Space>fh — поиск справки
vim.keymap.set("n", "<Space>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true })

-- Открытие/закрытие nvim-tree с Space + n
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
vim.keymap.set("n", "<leader>w", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- Автоматическое открытие дерева при запуске, если это директория
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local directory = vim.fn.argv(0)
		if vim.fn.isdirectory(directory) == 1 then
			vim.cmd("NvimTreeOpen")
		end
	end,
})

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>th", require("plugins.themeswitcher").switch_theme, { desc = "Выбор темы" })
