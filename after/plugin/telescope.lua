local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("rg > ") })
end)

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
	pickers = {
		buffers = {
			ignore_current_buffer = true,
			sort_lastused = true,
		},
	},
})
