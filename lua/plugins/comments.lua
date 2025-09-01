return {
	"OliverHeffernan/comments.nvim",
	config = function()
		require("comments")
		vim.api.nvim_set_keymap('n', '<C-k>', ':Comment<CR>', { noremap = true, silent = true })
		vim.api.nvim_set_keymap('i', '<C-k>', '<Esc>:Comment<CR>i', { noremap = true, silent = true })
	end,
}
