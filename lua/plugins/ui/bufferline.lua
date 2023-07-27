local current_year = os.date("*t").year
local birth_year = 2000
local age_at_death = 80
local years_remaining = birth_year + age_at_death - current_year

local hours_per_year = 8760
local remaining_hours = years_remaining * hours_per_year

local bufferline_icons = require("bye-nerdfont").get_bufferline_icons()
local bufferline = require("bufferline")
bufferline.setup({
	options = {
		buffer_close_icon = bufferline_icons.options.buffer_close_icon,
		modified_icon = bufferline_icons.options.modified_icon,
		close_icon = bufferline_icons.options.modified_icon,
		left_trunc_marker = bufferline_icons.options.left_trunc_marker,
		right_trunc_marker = bufferline_icons.options.right_trunc_marker,
		style_preset = {
			bufferline.style_preset.no_italic,
			bufferline.style_preset.no_bold,
		},
		offsets = {
			{
				filetype = "NvimTree",
				text = function()
					return ("about " .. remaining_hours .. " hours left")
				end,
				highlight = "Directory",
				text_align = "left",
			},
		},
		separator_style = "slant",
	},
})
vim.cmd([[hi BufferLineSeparator guifg=#15161E]])
vim.cmd([[hi BufferLineSeparatorSelected guifg=#15161E]])
vim.cmd([[hi BufferLineSeparatorVisible guifg=#15161E]])
vim.cmd([[hi BufferLineBackground guifg=#979797]])
vim.cmd([[hi BufferLineCloseButton guifg=#979797]])
