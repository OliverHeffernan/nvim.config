-- mapping to view a list of buffers
vim.keymap.set('n', '<leader>b', ':ls<CR>:b', {
	desc = "Quickly switch to a different buffer by it's number.",
	noremap = true,
	silent = true
})

-- mappings for splits and such
vim.keymap.set('n', '<C-W>5', ':vertical split<CR>', {
	desc = "Create a vertical split.",
	noremap = true,
	silent = true
})
vim.keymap.set('n', "<C-W>'", ":split<CR>", {
	desc = "Create a horizontal split.",
	noremap = true,
	silent = true

})

-- mapping to open oil by doing leader fo
vim.cmd('nnoremap <leader>fo :Oil<CR>')
vim.keymap.set('n', '<leader>fo', ':Oil<CR>', {
	desc = "Open oil.",
	noremap = true,
	silent = true
})

-- removed this remapping so that I can use ; command for repeating f commands.
-- remapping ; to : in normal mode
--vim.keymap.set('n', ';', ':', {
	--desc = "Easier to use ; instead of : for commands.",
	--noremap = true,
	--silent = true
--})

-- pasting last yank, not the last deletion
vim.keymap.set('n', ',p', '"0p', {
	desc = "Pasting the last yank after the cursor, not including deletions."
})
vim.keymap.set('n', ',P', '"0p', {
	desc = "Pasting the last yank before the cursor, not including deletions."
})

-- tabs stuff
vim.keymap.set('n', '<C-T>l', ':tabnext<CR>', {
	desc = "Switch to next tab.",
	noremap = true,
	silent = true
})
vim.keymap.set('n', '<C-T>h', ':tabnext<CR>', {
	desc = "Switch to previous tab.",
	noremap = true,
	silent = true
})
vim.keymap.set('n', '<C-T>t', ':tabnew<CR>', {
	desc = "Close a tab",
	noremap = true,
	silent = true
})

-- map jj to exit insert mode
vim.keymap.set('i', 'jj', '<Esc>', {
	desc = "Escape out of insert mode into normal mode.",
	noremap = true,
	silent = true
})

-- map ww to exit insert mode and write the current file
vim.keymap.set('i', 'ww', '<Esc>:w<CR>', {
	desc = "Save the current file.",
	noremap = true,
	silent = true
})

-- map yy to exit insert mode and yank the current line
vim.keymap.set('i', 'yy', '<Esc>yy', {
	desc = "Yank the current line when in insert mode.",
	noremap = true,
	silent = true
})

vim.keymap.set('n', '<leader>d',
	function()
		local d = vim.diagnostic.get_next()
		if d then
			vim.fn.setreg("+", d.message)
			print("yanked error")
		else
			print("no diagnostic found")
		end
	end, {
		desc = "Yank inline errors to clipboard",
		noremap = true,
		silent = true
	}
)
