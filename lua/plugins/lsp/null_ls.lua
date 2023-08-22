-- Including linter, formatter to lsp
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.diagnostics.luacheck,
		-- eslint generates unexpected warning because of no remote plugin
		-- null_ls.builtins.diagnostics.eslint,
	},
})
