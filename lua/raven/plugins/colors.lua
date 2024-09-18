return {
	"brenoprata10/nvim-highlight-colors",
	event = "VeryLazy",
	config = function()
		local color = require("nvim-highlight-colors")

		color.setup({
			render = "virtual",
			enable_tailwind = true,
			virtual_symbol_position = "eol",
		})
	end,
}
