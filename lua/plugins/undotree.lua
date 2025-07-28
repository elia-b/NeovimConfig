return {
	{
		"mbbill/undotree",
		-- lazy load when pressing the mapping
		lazy = true,
		cmd = "UndotreeToggle",
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle UndoTree" },
		},
		config = function()
			-- Plugin is vimscript-based, so configure via globals
			vim.g.undotree_WindowLayout = 2
			vim.g.undotree_DiffpanelHeight = 8
			-- optional: other g:undotree_... settings

			-- Enable persistent undo
			if vim.fn.has("persistent_undo") == 1 then
				local dir = vim.fn.stdpath("data") .. "/undo"
				if vim.fn.isdirectory(dir) == 0 then
					vim.fn.mkdir(dir, "p", "0700")
				end
				vim.opt.undodir = dir
				vim.opt.undofile = true
			end
		end,
	},
}
