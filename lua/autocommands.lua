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

-- Virtual environment activation
function activate_venv(venv_path)
	-- Set environment variables for the current Neovim instance
	vim.env.VIRTUAL_ENV = venv_path
	vim.env.PATH = venv_path .. "/bin:" .. vim.env.PATH
	-- Notify user
	vim.notify("Activated virtual environment: " .. venv_path, vim.log.levels.INFO)
end

-- Auto-activate the .venv if it exists at the project root
function auto_activate_venv()
	local venv_path = vim.fn.getcwd() .. "/.venv"
	if vim.fn.isdirectory(venv_path) == 1 then
		activate_venv(venv_path)
		return true
	end
	return false
end

auto_activate_venv()
