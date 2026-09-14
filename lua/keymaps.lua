vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Copy full absolute path to system clipboard
vim.keymap.set("n", "<leader>cf", function()
	vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy full file path to clipboard" })

-- Copy relative path to system clipboard
vim.keymap.set("n", "<leader>cr", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Copy relative file path to clipboard" })

-- Copy filename only to system clipboard
vim.keymap.set("n", "<leader>cn", function()
	vim.fn.setreg("+", vim.fn.expand("%:t"))
end, { desc = "Copy filename to clipboard" })

-- Insert current date
vim.keymap.set(
	"n",
	"<leader>id",
	'i<C-r>=strftime("%a, %d %b %Y, %H:%M %Z")<CR><Esc>',
	{ desc = "Insert current date" }
)

-- Toggle spell check
vim.keymap.set("n", "<leader>ts", "<cmd>set spell!<cr>", { desc = "Toggle Spell Check" })

-- Quickfix
vim.keymap.set("n", "<leader>qq", function()
	local qf_open = false

	for _, win in ipairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			qf_open = true
			break
		end
	end

	if qf_open then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end, { desc = "Quickfix: toggle" })

vim.keymap.set("n", "<leader>qn", "<cmd>cnext<CR>", {
	desc = "Quickfix: next",
})

vim.keymap.set("n", "<leader>qp", "<cmd>cprev<CR>", {
	desc = "Quickfix: previous",
})
