return{
	'stevearc/oil.nvim',
	--opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		require("oil").setup({
			delete_to_trash = true,
		})
	end,
}
