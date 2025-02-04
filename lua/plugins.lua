local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- file fuzzy finder
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	-- file manager
	{
		'stevearc/oil.nvim',
		opts = {},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
	},
	-- icons, used in Oil
	{
		'nvim-tree/nvim-web-devicons'
	},
	-- adds git stuff in the margins
	{
		'lewis6991/gitsigns.nvim'
	},
	-- autocomplete stuff for html
	{
		"mattn/emmet-vim",
		init = function()
			-- Optional: Set custom leader key for Emmet
			vim.g.user_emmet_expandabbr_key = '<C-f>'
			vim.cmd('let g:user_emmet_install_global = 0')
			vim.cmd('autocmd FileType html,css,vue EmmetInstall')
		end,
		lazy = true, -- Load only when needed
		event = "InsertEnter", -- Load Emmet when entering insert mode
		ft = { 'html', 'vue', 'javascriptreact', 'typescriptreact' },
	},
	-- language server stuff
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
	},
	-- auto complete
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"dcampos/cmp-emmet-vim"
		}
	},
	-- error stuff and other tools for typescript
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lu/plenary.nvim" }
	},
	-- basic comments plugin made by me
	{
		"OliverHeffernan/comments.nvim",
		config = function()
			require("comments")
		end,
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	-- better syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter"
	}
})

-- mappings for comments.nvim
vim.api.nvim_set_keymap('n', '<C-k>', ':Comment<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Esc>:Comment<CR>i', { noremap = true, silent = true })

-- require stuff
require('telescope').setup()
require('oil').setup()
require('nvim-web-devicons').setup()
require('gitsigns').setup()
require('lualine').setup()

require('languageServerSetups')
require('telescopeMappings')
require('cmpMappings')

require'nvim-treesitter.configs'.setup {
  --ensure_installed = "maintained", -- or specify specific languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false, -- set to true if you still need Vim regex highlighting
  },
}
