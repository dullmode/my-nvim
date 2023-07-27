require("bye-nerdfont").setup({
	mode = "simple",
})
local icons = require("bye-nerdfont").get_icons()
local default_icon = require("bye-nerdfont").get_default_icon()
require("nvim-web-devicons").set_icon({
	icons,
})
require("nvim-web-devicons").set_default_icon(default_icon)

-- LspDiagnosticsSign change by bye-nerdfont
local lualine_icons = require("bye-nerdfont").get_lualine_icons()
local signs = {
	Error = lualine_icons.sections.diagnostics.symbols.error,
	Warn = lualine_icons.sections.diagnostics.symbols.warn,
	Hint = lualine_icons.sections.diagnostics.symbols.hint,
	Info = lualine_icons.sections.diagnostics.symbols.info,
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
