-- Debug print at the very start

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
vim.api.nvim_set_hl(0, 'Comment', { fg = '#606060', italic = true })
vim.api.nvim_set_hl(0, 'Keyword', { fg = '#18D0E4', bold = true })
vim.api.nvim_set_hl(0, 'Type', { fg = '#18D0E4' })
vim.api.nvim_set_hl(0, 'String', { fg = '#FFBA59' })
vim.api.nvim_set_hl(0, 'Operator', { fg = '#FF5370' })
vim.api.nvim_set_hl(0, 'Statement', { fg = '#FF5370' })
vim.api.nvim_set_hl(0, 'Number', { fg = '#A0F2FF' })
vim.api.nvim_set_hl(0, 'Boolean', { fg = '#A0F2FF' })
vim.api.nvim_set_hl(0, 'Function', { fg = '#42FFAD' })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#16202D' })
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#4371AA' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#7B9FCB' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#16202D' })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#16202D' })

-- Debug print after setting the theme
