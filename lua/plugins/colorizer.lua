return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	config = function()
		require("colorizer").setup({
			user_default_options = {
				names = false, -- "Name" codes like Blue or red.
			},
		})
	end,
	opts = { -- set to setup table
	},
}
