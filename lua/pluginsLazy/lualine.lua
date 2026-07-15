return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "lewis6991/gitsigns.nvim" },
	config = function()
		local function diff_source()
			local status = vim.b.gitsigns_status_dict
			if not status then
				return nil
			end

			return {
				added = status.added,
				modified = status.changed,
				removed = status.removed,
			}
		end

		require("lualine").setup({
			sections = {
				lualine_b = {
					"branch",
					{ "diff", source = diff_source },
					"diagnostics",
				},
			},
		})
	end,
}
