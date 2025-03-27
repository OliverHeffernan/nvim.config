local jdtls = require("jdtls")

local root_markers = { ".git", "mvnw", "gradlew", ".project" }
local root_dir = require("jdtls.setup").find_root(root_markers) or vim.fin.getcwd()

local homebrew_jdtls = "/opt/homebrew/Cellar/jdtls/1.45.0/bin/jdtls"

local config = {
	cmd = { homebrew_jdtls },
	root_dir = root_dir,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

jdtls.start_or_attach(config)
