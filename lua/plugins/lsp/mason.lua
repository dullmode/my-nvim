-- LSP Sever management
require("mason").setup()
require("mason-lspconfig").setup_handlers({
	function(server)
		require("lspconfig")[server].setup({
			capabilities = capabilities,
		})
	end,
})

