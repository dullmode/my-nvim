local keymap = vim.keymap

-- Map Y to y$
keymap.set("n", "Y", "y$")

-- Map <C-h>, <C-l> to switch to the previous buffer, next buffer
keymap.set("n", "H", ":bprev<CR>", { silent = true })
keymap.set("n", "L", ":bnext<CR>", { silent = true })
keymap.set("n", "Q", ":bd<CR>:bprev<CR>", { silent = true })

-- Map <Esc><Esc> to clear search highlight
keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>")

-- Hop.nvim
keymap.set("", "<Leader>w", ":HopWord<CR>")
keymap.set("", "<Leader>l", ":HopLine<CR>")
local hop = require("hop")
local directions = require("hop.hint").HintDirection
keymap.set("", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })

keymap.set("", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })

-- cmp-nvim
keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap.set("n", "g=", "<cmd>lua vim.lsp.buf.format()<CR>")
keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
keymap.set("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>")
keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap.set("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap.set("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
keymap.set("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")

-- nvim-tree
keymap.set("n", "<Leader>e", ":NvimTreeFindFileToggle<CR>", { silent = true })

keymap.set("t", "<esc>", [[<C-\><C-n>]])
keymap.set("t", "<C-[>", [[<C-\><C-n>]])
