-- LSP Sever management
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  require('lspconfig')[server].setup {
    capabilities = capabilities
  }
end })

-- Including linter, formatter to lsp
local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.eslint,
  },
})

-- Completion setting
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  }),
  experimental = {
    ghost_text = false,
  }
})

return plugins
