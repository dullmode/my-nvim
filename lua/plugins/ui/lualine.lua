-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require("lualine")
local lualine_icons = require("bye-nerdfont").get_lualine_icons()

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	function()
		return "▊"
	end,
	color = { fg = "#76946A" },
	padding = { left = 0, right = 1 },
})

ins_left({
	-- Lsp server name .
	function()
		local clients = {}
		for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
			if client.name == "null-ls" then
				local sources = {}
				for _, source in ipairs(require("null-ls.sources").get_available(vim.bo.filetype)) do
					table.insert(sources, source.name)
				end
				table.insert(clients, "null-ls(" .. table.concat(sources, ", ") .. ")")
			else
				table.insert(clients, client.name)
			end
		end
		-- return " " .. table.concat(clients, ", ")
		if next(clients) == nil then
			return "No lsp"
		end
		return table.concat(clients, ", ")
	end,
	icon = "⛶ ",
})

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = lualine_icons.sections.diagnostics.symbols,
})

ins_left({
	"lsp_progress",
	display_components = { "spinner", { "title", "percentage" } },
})

ins_right({
	"branch",
})

ins_right({
	"diff",
	symbols = lualine_icons.sections.diff.symbols,
	cond = conditions.hide_in_width,
})

ins_right({
	function()
		return "▊"
	end,
	color = { fg = "#76946A" },
	padding = { left = 1 },
})

-- Now don't forget to initialize lualine
lualine.setup(config)
