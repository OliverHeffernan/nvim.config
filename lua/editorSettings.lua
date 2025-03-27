-- copy and paste using clipboard buffer
vim.opt.clipboard = 'unnamedplus'

vim.g.mapleader = " "

-- Enable line numbering
vim.o.number = true
vim.o.relativenumber = true

-- 4 spaces when tab key is pressed
vim.cmd('set tabstop=4')

-- indent width set to 4
vim.cmd('set shiftwidth=4')
-- making emmet use the same shift width
vim.g.user_emmet_indent_size = vim.opt.shiftwidth:get()

-- adding vertical lines for indentation
vim.opt.list = true
vim.opt.listchars = { tab = "│ ", eol = " ", trail = "·" }

-- true color stuff
vim.o.termguicolors = true

-- making the cursorline highlighted
vim.cmd('set cursorline')

vim.g.vim_vue_plugin_load_full_syntax = 1
vim.cmd [[ autocmd FileType vue setlocal indentexpr= ]]
