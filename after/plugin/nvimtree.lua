require("nvim-tree").setup({
	view = {
		side = "right",
	},
	filters = {
		dotfiles = false,
	},
	update_focused_file = {
		enable = true,
	},
})
