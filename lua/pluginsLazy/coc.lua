return {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
        vim.cmd([[
            inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
            inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
        ]])
    end
}
