return {
	"seblyng/roslyn.nvim",
	ft = { "cs" },
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			},
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			dependencies = { "mason-org/mason.nvim" },
			opts = { ensure_installed = { "roslyn" } },
		},
	},
	opts = {
		-- MonoGame projects commonly keep the solution above the game project.
		broad_search = true,
	},
	config = function(_, opts)
		local function set_csharp_keymaps(bufnr)
			local map_opts = { buffer = bufnr, silent = true }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, map_opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, map_opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, map_opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, map_opts)
		end

		-- The plugin enables Roslyn before lazy.nvim runs this config callback, so
		-- use LspAttach rather than on_attach in the server configuration.
		local group = vim.api.nvim_create_augroup("RoslynKeymaps", { clear = true })
		vim.api.nvim_create_autocmd("LspAttach", {
			group = group,
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.name == "roslyn" then
					set_csharp_keymaps(args.buf)
				end
			end,
		})
		-- Handle the C# buffer that caused this lazy-loaded plugin to start.
		if vim.bo.filetype == "cs" then
			set_csharp_keymaps(0)
		end

		vim.lsp.config("roslyn", {
			settings = {
				["csharp|background_analysis"] = {
					dotnet_analyzer_diagnostics_scope = "fullSolution",
					dotnet_compiler_diagnostics_scope = "fullSolution",
				},
				["csharp|completion"] = {
					dotnet_show_completion_items_from_unimported_namespaces = true,
				},
			},
		})

		require("roslyn").setup(opts)
	end,
}
