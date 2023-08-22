require("hop").setup()

local keymap = vim.keymap
keymap.set("", "mw", ":HopWord<CR>")
keymap.set("", "ml", ":HopLine<CR>")
