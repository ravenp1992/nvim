return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local substitute = require("substitute")

		substitute.setup()

		local keymap = vim.keymap

		keymap.set("n", "s", substitute.operator, { desc = "Substitue with motion" })
		keymap.set("n", "ss", substitute.line, { desc = "Substitue line" })
		keymap.set("n", "S", substitute.eol, { desc = "Substitue to end of line" })
		keymap.set("x", "s", substitute.visual, { desc = "Substitue in visual mode" })
	end,
}
