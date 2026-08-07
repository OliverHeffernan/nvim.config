return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parsers = {
			"java",
			"lua",
			"cpp",
			"rust",
			"python",
			"objc",
			"bash",
			"go",
			"markdown",
			"markdown_inline",
			"html",
			"vue",
			"tsx",
			"typescript",
			"javascript",
			"css",
			"c_sharp"
		}

		require("nvim-treesitter").install(parsers):wait(300000)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(args)
				local ok = pcall(vim.treesitter.start, args.buf)
				if ok then
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
