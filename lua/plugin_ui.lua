-- bottom bar
require("lualine").setup()

-- side bar
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

local nvim_tree_icons = require("byebye-mojibake").get_nvim_tree_icons()
require("nvim-tree").setup({
	on_attach = my_on_attach,
	renderer = {
		icons = {
			glyphs = nvim_tree_icons.renderer.icons.glyphs,
		},
	},
	diagnostics = {
		icons = nvim_tree_icons.diagnostics.icons,
	},
})

-- upper bar
local bufferline_icons = require("byebye-mojibake").get_bufferline_icons()
require("bufferline").setup({
	options = {
		mode = "tabs",
		buffer_close_icon = bufferline_icons.options.buffer_close_icon,
		modified_icon = bufferline_icons.options.modified_icon,
		close_icon = bufferline_icons.options.modified_icon,
		left_trunc_marker = bufferline_icons.options.left_trunc_marker,
		right_trunc_marker = bufferline_icons.options.right_trunc_marker,
	},
})

-- inital screen
-- ascii: https://www.twitchquotes.com/copypastas/ascii-art
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"⡏⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠹",
	"⡇ ⣀⣀⠀⠀⢀⣀⡀⣀⣀⣀⠀⢀⣀⡀⢀⣀⣀⡀⣀⣀⡀⠀⠀⠀⢀⣀⡀⢸",
	"⡇ ⢸⢻⣧⡀⠀⢸⠀⠈⢿⣧⠀⠀⡜⠀⠀⣿⡇⠀⠀⡿⣿⡄⠀⢠⢿⣿⠀⢸",
	"⡇ ⢸⠀⠹⣿⣄⢸⠀⠀⠘⣿⡆⢰⠁⠀⠀⣿⡇⠀⠀⡇⢻⣷⠀⠎⢸⣿⠀⢸",
	"⡇ ⢸⠀⠀⠘⢿⣮⠀⠀⠀⢹⣿⠂⠀⠀⠀⣿⡇⠀⠀⡇⠀⢿⡏⠀⢸⣿⠀⢸",
	"⡇ ⠉⠉⠀⠀⠈⠉⠀⠀⠀⠀⠉⠀⠀⠀⠈⠉⠉⠁⠉⠉⠁⠈⠁⠈⠉⠉⠁⢸",
	"⣇⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣰",
	"⠄⣾⣿⡇⢸⣿⣿⣿⠄⠈⣿⣿⣿⣿⠈⣿⡇⢹⣿⣿⣿⡇⡇⢸⣿⣿⡇⣿⣿⣿",
	"⢠⣿⣿⡇⢸⣿⣿⣿⡇⠄⢹⣿⣿⣿⡀⣿⣧⢸⣿⣿⣿⠁⡇⢸⣿⣿⠁⣿⣿⣿",
	"⢸⣿⣿⡇⠸⣿⣿⣿⣿⡄⠈⢿⣿⣿⡇⢸⣿⡀⣿⣿⡿⠸⡇⣸⣿⣿⠄⣿⣿⣿",
	"⢸⣿⡿⠷⠄⠿⠿⠿⠟⠓⠰⠘⠿⣿⣿⡈⣿⡇⢹⡟⠰⠦⠁⠈⠉⠋⠄⠻⢿⣿",
	"⢨⡑⠶⡏⠛⠐⠋⠓⠲⠶⣭⣤⣴⣦⣭⣥⣮⣾⣬⣴⡮⠝⠒⠂⠂⠘⠉⠿⠖⣬",
	"⠈⠉⠄⡀⠄⣀⣀⣀⣀⠈⢛⣿⣿⣿⣿⣿⣿⣿⣿⣟⠁⣀⣤⣤⣠⡀⠄⡀⠈⠁",
	"⠄⠠⣾⡀⣾⣿⣧⣼⣿⡿⢠⣿⣿⣿⣿⣿⣿⣿⣿⣧⣼⣿⣧⣼⣿⣿⢀⣿⡇⠄",
	"⡀⠄⠻⣷⡘⢿⣿⣿⡿⢣⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣜⢿⣿⣿⡿⢃⣾⠟⢁⠈",
	"⢃⢻⣶⣬⣿⣶⣬⣥⣶⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣷⣶⣶⣾⣿⣷⣾⣾⢣",
	"⡄⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠘",
	"⣿⡐⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢠⢃",
	"⣿⣷⡀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⡿⠋⢀⠆⣼",
	"⣿⣿⣷⡀⠄⠈⠛⢿⣿⣿⣿⣿⣷⣶⣶⣶⣶⣶⣿⣿⣿⣿⣿⠿⠋⠠⠂⢀⣾⣿",
	"⣿⣿⣿⣧⠄⠄⢵⢠⣈⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢋⡁⢰⠏⠄⠄⣼⣿⣿",
	"⢻⣿⣿⣿⡄⢢⠨⠄⣯⠄⠄⣌⣉⠛⠻⠟⠛⢋⣉⣤⠄⢸⡇⣨⣤⠄⢸⣿⣿⣿",
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("e", "①  > New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "②  > Find file", ":NvimTreeFindFileToggle<CR>"),
	dashboard.button("r", "③  > Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("s", "④  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
	dashboard.button("q", "⑤  > Quit NVIM", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
