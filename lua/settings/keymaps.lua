local keymap = vim.keymap

-- Map Y to y$
keymap.set("n", "Y", "y$")

-- Map <C-h>, <C-l> to switch to the previous buffer, next buffer
keymap.set("n", "H", ":bprev<CR>", { silent = true })
keymap.set("n", "L", ":bnext<CR>", { silent = true })

-- Map <Esc><Esc> to clear search highlight
keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>")

-- terminal mode escape
keymap.set("t", "<esc>", [[<C-\><C-n>]])
keymap.set("t", "<C-[>", [[<C-\><C-n>]])
