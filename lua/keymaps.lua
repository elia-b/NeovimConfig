vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
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

vim.keymap.set(
	"n",
	"<leader>id",
	'i<C-r>=strftime("%a, %d %b %Y, %H:%M %Z")<CR><Esc>',
	{ desc = "Insert current date" }
)
