return {
	"lervag/vimtex",
	ft = { "tex", "plaintex", "bib" },
	init = function()
		vim.g.vimtex_view_method = "general"
		vim.g.vimtex_view_general_viewer = "open"
		vim.g.vimtex_view_general_options = "-a Preview"
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_indent_enabled = 1
		vim.g.vimtex_compiler_latexmk = {
			options = {
				"-pdf",
				"-bibtex",
				"-interaction=nonstopmode",
				"-halt-on-error",
				"-synctex=1",
			},
		}
		vim.g.vimtex_quickfix_mode = 0
		vim.g.vimtex_syntax_conceal_disable = 0
	end,
}
