-- mapping to view a list of buffers
vim.cmd('nnoremap <leader>b :ls<CR>:b')

-- mappings for splits and such
vim.cmd('nnoremap <C-W>5 :vertical split<CR>')
vim.cmd("nnoremap <C-W>' :split<CR>")

-- mapping to open oil by doing leader fo
vim.cmd('nnoremap <leader>fo :Oil<CR>')

-- remapping ; to : in normal mode
vim.cmd('nnoremap ; :');

-- pasting last yank, not the last deletion
vim.cmd('nmap ,p "0p')
vim.cmd('nmap ,P "0p')

-- tabs stuff
vim.cmd('nnoremap <leader>tn :tabnew<CR>')
vim.cmd('nnoremap <leader>tc :tabclose<CR>')

-- mapping control i to escape in insert mode
vim.cmd('inoremap <C-i> <Esc>')
