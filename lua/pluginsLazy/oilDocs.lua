return {
	"OliverHeffernan/oilDocs",
	branch = "main",
	main = "oilDocs",
	lazy = false,
	dependencies = {
		"stevearc/oil.nvim",
	},
	opts = {
		split = "vertical",
		height = 12,
		width = 48,
		close_when_missing = true,
		create_missing = true,
		keymaps = {
			open = "gN",
			toggle = "gM",
		},
	},
}
