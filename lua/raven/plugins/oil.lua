return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	enabled = false,
	opts = {},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			use_default_keymaps = true,
			view_options = {
				show_hidden = true,
				natural_order = false,
			},
		})

		vim.keymap.set("n", "<leader>ee", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
	end,
}
