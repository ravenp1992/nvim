return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	},
	config = function()
		local nvimtree = require("nvim-tree")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
				side = "right",
			},

			renderer = {
				indent_markers = {
					enable = true,
				},
			},

			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},

			filters = {
				custom = { ".DS_Store" },
			},

			update_focused_file = {
				enable = true,
			},

			git = {
				ignore = false,
			},
		})

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>ex", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
	end,
}
