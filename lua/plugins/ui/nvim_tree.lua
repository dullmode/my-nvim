vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.termguicolors = true
local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")
	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.del("n", "H", { buffer = bufnr })
	vim.keymap.set("n", "!", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

local nvim_tree_icons = require("bye-nerdfont").get_nvim_tree_icons()
require("nvim-tree").setup({
	on_attach = my_on_attach,
	renderer = nvim_tree_icons.renderer,
	diagnostics = nvim_tree_icons.diagnostics,
})
