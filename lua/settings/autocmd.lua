local create = vim.api.nvim_create_autocmd

create({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.sql" },
	callback = function()
		vim.opt.expandtab = true
	end,
})
create({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.go" },
	callback = function()
		vim.opt.expandtab = false
	end,
})
create({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.py", "*.lua" },
	command = "set shiftwidth=4",
})
create({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.ts", "*.vue", "*.dart" },
	command = "set shiftwidth=2",
})
