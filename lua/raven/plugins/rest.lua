return {
	"rest-nvim/rest.nvim",
	ft = "http",
	dependencies = { "luarocks.nvim" },
	config = function()
		require("rest-nvim").setup()

		local keymap = vim.keymap

		keymap.set(
			"n",
			"<leader>rr",
			":Rest run<CR>",
			{ noremap = true, silent = false, desc = "Run request under the cursor" }
		)
		keymap.set(
			"n",
			"<leader>rl",
			":Rest run last<CR>",
			{ noremap = true, silent = false, desc = "Re-run latest request" }
		)
	end,
}
