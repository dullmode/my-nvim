local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"hrsh7th/vim-vsnip",
		"hrsh7th/cmp-vsnip",
	},
	-- user interface
	"goolord/alpha-nvim",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	-- '~/programs/tools/bye-nerdfont.nvim'
	"dullmode/bye-nerdfont.nvim",
	{
		"akinsho/bufferline.nvim",
		tag = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	"arkav/lualine-lsp-progress",
	-- util
	{
		"phaazon/hop.nvim",
		branch = "v2",
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
	{
		"kylechui/nvim-surround",
		tag = "*",
	},
	"karb94/neoscroll.nvim",
	"lukas-reineke/indent-blankline.nvim",
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	"windwp/nvim-ts-autotag",
	-- coloring
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	"rebelot/kanagawa.nvim",
	"norcalli/nvim-colorizer.lua",
})
