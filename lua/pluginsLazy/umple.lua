return {
	'umple/umple.nvim',
	build = './scripts/build.sh',
	dependencies = {
		'neovim/nvim-lspconfig',
		'nvim-treesitter/nvim-treesitter',
	},
	config = function()
		require("umple-lsp").setup({
			on_attach = function(client, bufnr)
				local opts = { buffer = bufnr }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
				vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			end,
		})
	end,
}
