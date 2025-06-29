return {
	"nvim-lualine/lualine.nvim",

	config = function()
		local everforest_hard = require("lualine.themes.everforest")

		-- Change the background of lualine_c section for normal mode
		everforest_hard.normal.c.bg = "#272e33"

		require("lualine").setup({
			options = {
				path = 1,
				component_separators = "",
				section_separators = { left = "", right = "" },
				theme = everforest_hard,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" }, -- Remove 'encoding' if it was here
				lualine_x = { "filetype" }, -- Remove 'encoding' from here
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
