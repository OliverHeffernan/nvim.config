local ts_tools = require('typescript-tools')
require'lspconfig'.ts_ls.setup{
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
				languages = {"javascript", "typescript", "vue" },
			},
		},
	},
	filetypes = {
		"javascript",
		"typescript",
	},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup({
	on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	end,
	capabilities = capabilities,
	settings = {
		html = {
			format = {
				enable = true
			}
		}
	},
	filetypes = {
		"html",
		"vue"
	}
})

require'lspconfig'.jdtls.setup {
	cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xms1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-jar', '/path/to/jdtls/plugins/org.eclipse.equinox.launcher_*.jar', -- Adjust path
		'-configuration', '/path/to/jdtls/config_linux', -- Adjust for your OS (config_linux, config_mac, etc.)
		'-data', vim.fn.stdpath('cache') .. '/jdtls-workspace'
	},
	root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'src' }, { upward = true })[1]) or vim.fn.getcwd(),
	settings = {
		java = {
			project = {
				referencedLibraries = {
					'lib/mylibrary.jar' -- Path to your .jar file relative to project root
				}
			}
		}
	},
	init_options = {
		bundles = {}
	}
}

require'lspconfig'.rust_analyzer.setup {
	settings = {
		['rust_analyzer'] = {
			checkOnSave = {
				command = "clippy",
			},
			procMacro = {
				enable = true
			},
			cargo = {
				allFeatures = true
			}
		},
	}
}

require'lspconfig'.clangd.setup{}
