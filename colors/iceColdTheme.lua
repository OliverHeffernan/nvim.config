-- Clear existing highlights
vim.cmd('hi clear')

-- Reset syntax if syntax highlighting is on
if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end

-- Set colorscheme name
vim.g.colors_name = 'iceColdTheme'

-- Define the theme
vim.api.nvim_set_hl(0, 'Normal', { fg = '#ffffff', bg = '#0C1118' })

vim.api.nvim_set_hl(0, 'Keyword', { fg = '#77f1fc' })
vim.api.nvim_set_hl(0, 'Type', { fg = '#93D8FC' })
vim.api.nvim_set_hl(0, 'Comment', { fg = '#606060' })
vim.api.nvim_set_hl(0, 'Function', { fg = '#42FFAD' })

vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#16202D' })
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#4371AA' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#7B9FCB' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#16202D' })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#16202D' })

-- Add Tree-sitter specific highlights
vim.api.nvim_set_hl(0, '@tag', { fg = '#96DEFF' })
vim.api.nvim_set_hl(0, '@tag.attribute', { fg = '#80ffd4' })
vim.api.nvim_set_hl(0, '@attribute', { fg = '#42FFAD' })
vim.api.nvim_set_hl(0, '@text', { fg = '#FFFFFF' })
vim.api.nvim_set_hl(0, '@comment', { fg = '#606060' })
vim.api.nvim_set_hl(0, '@string', { fg = '#fc996f' })
vim.api.nvim_set_hl(0, '@operator', { fg = '#FF5370' })
vim.api.nvim_set_hl(0, '@tag.punctuation', { fg = '#FFFFFF' })

vim.api.nvim_set_hl(0, '@tag.bracket', { fg = '#FFFFFF' })
vim.api.nvim_set_hl(0, '@tag.delimiter', { fg = '#FFFFFF' })

-- highlight colours
vim.api.nvim_set_hl(0, "Search", { bg = "#3B809F" })
vim.api.nvim_set_hl(0, "IncSearch", { bg = "#3B809F" })
vim.api.nvim_set_hl(0, "CurSearch", { bg = "#67A4AE" })
