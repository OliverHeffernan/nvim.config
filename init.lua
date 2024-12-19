-- changing the leader key from \ to space
vim.g.mapleader = " "

-- a plugin manager
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

-- Enable line numbering
vim.o.number = true
vim.o.relativenumber = true

-- 4 spaces when tab key is pressed
vim.cmd('set tabstop=4')

-- indent width set to 4
vim.cmd('set shiftwidth=4')
require("lazy").setup({
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"nvim-treesitter/nvim-treesitter"
	},
	{
	  'stevearc/oil.nvim',
	  ---@module 'oil'
	  ---@type oil.SetupOpts
	  opts = {},
	  -- Optional dependencies
	  dependencies = { { "echasnovski/mini.icons", opts = {} } },
	},
	{
		'nvim-tree/nvim-web-devicons'
	},
	{
		'lewis6991/gitsigns.nvim'
	},
})

-- stuff for emmet

vim.cmd[[syntax enable]]
vim.cmd[[colorscheme tokyonight-storm]]

-- reuire stuff
require('telescope').setup()
require('oil').setup()
require('nvim-web-devicons').setup()
require('gitsigns').setup()
-- stuff for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

-- Key mappings for nvim dap
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<F5>', ':lua require"dap".continue()<CR>', opts)
map('n', '<F10>', ':lua require"dap".step_over()<CR>', opts)
map('n', '<F11>', ':lua require"dap".step_into()<CR>', opts)
map('n', '<F12>', ':lua require"dap".step_out()<CR>', opts)
map('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>', opts)

-- use clipboard for yank and paste
vim.opt.clipboard = 'unnamedplus'

-- removes the behaviour of autocommenting when creating a new line after a single line comment
vim.cmd('set formatoptions-=cro')

-- true color stuff
vim.o.termguicolors = true
