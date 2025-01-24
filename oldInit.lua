--changing the leader key from \ to space
vim.g.mapleader = " "

--a plugin manager
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
-- making emmet use the same shift width
vim.g.user_emmet_indent_size = vim.opt.shiftwidth:get()
require("lazy").setup({
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
--	{
--		'github/copilot.vim'
--	},
	{
		"rktjmp/lush.nvim",
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
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
	{
		"OliverHeffernan/comments.nvim",
		config = function()
			require("comments")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
	},
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
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lu/plenary.nvim" }
	},
	-- incrementing numbers
	{
		"monaqa/dial.nvim"
	},
	-- similar to treesitter, but potentially better for vue files
	{
		'sheerun/vim-polyglot'
	},
	{
		"jose-elias-alvarez/null-ls.nvim"
	}
})

-- configuration for vim files
--vim.cmd([[autocmd FileType vue setlocal syntax=vue]])

-- configuration for treesitter
require('nvim-treesitter.configs').setup {
	highlight = {
		additional_vim_regex_highlighting = false,
		enable = true
	},
	incremental_selection = {
		enable = true,
	},
	ensure_installed = {
		"vue",
		"html"
	},
	indent = { enable = true }
}

vim.cmd([[set synmaxcol=3000]])

-- configuration for emmet in vue
vim.cmd([[
	autocmd BufNewFile,BufRead *.vue set filetype=html
]])

 --mappings for cmp autocompletion
--
--
local ts_tools = require('typescript-tools')
local lspconfig = require('lspconfig')
local null_ls = require('null-ls')
local util = require('lspconfig.util')

local cmp = require('cmp')
lspconfig.ts_ls.setup({
  filetypes = { "javascript", "typescript", "vue", "js", "ts", "html" },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
})

--ts_tools.setup({
	--settings = {
		--tsserver = {
			--completions = {
				--completeFunctionCalls = true
			--}
		--}
	--},
	--filetypes = { 'vue', 'typescript', 'javascript' }
--})

--lspconfig.volar.setup{
	--filetypes = { 'vue', 'html' },
	--init_options = {
		--typescript = {
			--tsdk = vim.fn.expand("~/.npm-global/lib/node_modules/typescript/lib")
		--}
	--},
	--capabilities = require('cmp_nvim_lsp').default_capabilities(),
--}

null_ls.setup({
	filetypes = { 'vue', 'html' },
	sources = {
		null_ls.builtins.formatting.prettier,
	},
})

vim.cmd([[autocmd BufRead,BufNewFile *.vue set filetype=html]])

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<CR>'] = cmp.mapping.confirm({ select = true })
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
		--{ name = 'emmet_vim' }
	})
})

vim.cmd[[syntax enable]]

vim.cmd[[colorscheme iceColdTheme]]

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

-- making the cursorline highlighted
vim.cmd('set cursorline')

-- remapping ;; to Esc
vim.cmd('imap ;; <Esc>')

-- mappings for comments.nvim, setting control k to comment a line
vim.api.nvim_set_keymap('n', '<C-k>', ':Comment<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Esc>:Comment<CR>i', { noremap = true, silent = true })


-- adding vertical lines for indentation
vim.opt.list = true
vim.opt.listchars = { tab = "│ ", eol = " ", trail = "·" }
