return {
	"mattn/emmet-vim",
	config = function()
		-- Optional: Set custom leader key for Emmet
		vim.g.user_emmet_expandabbr_key = '<C-f>'
		vim.cmd('let g:user_emmet_install_global = 0')
		vim.cmd('autocmd FileType html,css,vue EmmetInstall')
	end,
	lazy = true, -- Load only when needed
	event = "InsertEnter", -- Load Emmet when entering insert mode
	ft = { 'html', 'vue', 'javascriptreact', 'typescriptreact' }
}
