vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.termguicolors = true

vim.opt.showmode = false

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.mouse = ""

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.inccommand = "split"

vim.opt.hlsearch = true

vim.opt.spelllang = "en_us"
vim.opt.spell = false

vim.g.have_nerd_font = true

vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },

	virtual_text = false, -- Text shows up at the end of the line
	virtual_lines = true, -- Text shows up underneath the line, with virtual lines

	-- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
	jump = { float = true },
})
