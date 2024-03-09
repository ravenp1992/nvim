require("neo-tree").setup({
	window = {
		position = "right",
		width = 40,
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = true,
			hide_gitignored = true,
		},
		follow_current_file = {
			enabled = true,
		},
	},
})
