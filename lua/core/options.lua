vim.o.clipboard = 'unnamedplus'
vim.g.mapleader = " "
vim.o.ttyfast = true
vim.o.scrolloff = 30
vim.cmd('filetype plugin indent on')
vim.o.expandtab = true      -- Превращать TAB в пробелы
vim.o.shiftwidth = 4        -- Отступ при автоформатировании = 4 пробела
vim.o.tabstop = 4           -- Визуальный размер TAB = 4 пробела
vim.o.softtabstop = 4       -- Кол-во пробелов при нажатии TAB = 4
vim.o.smarttab = true       -- TAB учитывает shiftwidth
vim.opt.cursorline = true
vim.cmd [[highlight CursorLine guibg=#2e2e2e]]

vim.o.termguicolors = true

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  callback = function()
    vim.wo.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    vim.wo.relativenumber = true
  end,
})


vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    -- Если открыт пустой буфер без имени и nvim-tree активен
    if vim.bo.filetype == "" and vim.fn.bufname() == "" then
      local wins = vim.api.nvim_list_wins()
      for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        local ft = vim.bo[buf].filetype
        if ft == "NvimTree" then
          -- Закрываем пустой буфер
          vim.api.nvim_buf_delete(0, { force = true })
          return
        end
      end
    end
  end,
})

-- Скрываем статуслайн, если вошли в окно с NvimTree
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
