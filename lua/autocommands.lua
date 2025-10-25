vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Remember cursor position when reopening files
vim.api.nvim_create_augroup("remember_cursor_position", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
	group = "remember_cursor_position",
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local line_count = vim.api.nvim_buf_line_count(0)
		local line = mark[1]

		if line > 1 and line <= line_count then
			vim.cmd('normal! g`"')
			vim.cmd("normal! zz")
		end
	end,
})
