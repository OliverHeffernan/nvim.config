return {
	'neoclide/coc.nvim',
	branch = 'release',
	config = function()

		vim.cmd([[
			inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
			inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
			]])
		local keyset = vim.keymap.set
		-- Use K to show documentation in preview window
		function _G.show_docs()
			local cw = vim.fn.expand('<cword>')
			if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
				vim.api.nvim_command('h ' .. cw)
			elseif vim.api.nvim_eval('coc#rpc#ready()') then
				vim.fn.CocActionAsync('doHover')
			else
				vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
			end
		end
		keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})
		keyset("n", "<C-K>", "<Plug>(coc-float-jump)", {silent = true, desc = "Jump to next float window"})
		keyset("n", "q", "<Cmd>if coc#float#has_float() | call coc#float#close_all() | endif<CR>", {silent = true})
		keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", {silent = true, desc = "Apply current quick fix"})

		-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
		vim.api.nvim_create_augroup("CocGroup", {})
		vim.api.nvim_create_autocmd("CursorHold", {
			group = "CocGroup",
			command = "silent call CocActionAsync('highlight')",
			desc = "Highlight symbol under cursor on CursorHold"
		})

		-- Symbol renaming
		keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

	end
}
