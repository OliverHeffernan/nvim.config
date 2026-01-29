return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require('nvim-treesitter.configs').setup {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			ensure_installed = {
				'java',
				'lua',
				'cpp',
				'rust',
				'python',
                'objc',
                'bash',
				'go'
			}
		}
	end,

}
