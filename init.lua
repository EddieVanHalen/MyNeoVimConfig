vim.cmd("let mapleader = ' '")

vim.cmd [[
  call plug#begin('~/.local/share/nvim/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'sbdchd/neoformat'
  Plug 'vim-airline/vim-airline-themes'
  call plug#end()
]]

require("preferences")
require("installing-lazy")
require("keymaps")
require("icons").setup()

vim.api.nvim_create_user_command('LiveServer', function()
  vim.fn.jobstart("live-server", {
    on_exit = function()
      print("Live Server started!")
    end,
    on_stderr = function(_, data)
      if data then 
        print("Error: " .. table.concat(data, "\n"))
      end
    end
  })
end, {desc = "Start Live Server"})


vim.api.nvim_create_autocmd({ "VimEnter" }, {
  nested = true,
  callback = function()
    vim.cmd.colorscheme(vim.g.SCHEME)
  end,
})

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  callback = function(params)
    vim.g.SCHEME = params.match
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_set_keymap("n", "<C-S-Left>", "b", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-Right>", "e", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-S-Left>", "<C-o>b", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-S-Right>", "<C-o>e", { noremap = true, silent = true })

