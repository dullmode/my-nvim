require("bye-nerdfont").setup({
	mode = "simple",
})
local icons = require("bye-nerdfont").get_icons()
local default_icon = require("bye-nerdfont").get_default_icon()
require("nvim-web-devicons").set_icon({
	icons,
})
require("nvim-web-devicons").set_default_icon(default_icon)
