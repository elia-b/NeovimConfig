return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		on_attach = function(buffer)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
			end

			-- Navigation
			map("n", "]h", gs.next_hunk, "Next Hunk")
			map("n", "[h", gs.prev_hunk, "Prev Hunk")

			-- Actions
			map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk (Inline)")
			map("n", "<leader>hQ", gs.setqflist, "Send all hunks to Quickfix")

			-- The Diff Commands
			map("n", "<leader>hD", gs.diffthis, "Diff This (Open Split)")

			-- The "Get Me Out Of Here" Command
			-- This turns off diff mode and closes the extra window
			map("n", "<leader>hX", function()
				vim.cmd("diffoff!")
				-- If the diff split is still open, this helps close it
				if vim.fn.winnr("$") > 1 then
					vim.cmd("cclose") -- close quickfix if open
					-- Optional: You could add 'vim.cmd("q")' here if you're brave
				end
			end, "Exit Diff Mode")
		end,
	},
}
