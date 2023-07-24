local bufferline_icons = require("bye-nerdfont").get_bufferline_icons()
require("bufferline").setup({
	options = bufferline_icons.options,
})
