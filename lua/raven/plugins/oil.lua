return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup()

		local keymap = vim.keymap
		keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		keymap.set("n", "<space>-", oil.toggle_float, { desc = "Open Oil in floating window" })
	end,
}
