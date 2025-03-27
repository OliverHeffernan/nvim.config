vim.g.ale_enabled = 1
vim.g.ale_virtualtext_cursor = 'current'
vim.g.ale_fix_on_save = 0
vim.g.ale_fixers = {
	vue = { 'eslint' },
	javascript = { 'eslint', 'prettier' },
	typescript = { 'eslint' },
	python = { 'black', 'isort' },
	html = { 'prettier' },
	css = { 'prettier' },
	json = { 'prettier' },
}
vim.g.ale_linters = {
	javascript = { 'eslint' },
	python = { 'flake8', 'mypy' },
}
vim.g.ale_open_list = 1

vim.g.ale_set_loclist = 0
vim.g.ale_set_quickfix = 0
