return {
	"mg979/vim-visual-multi",
	init = function()
		vim.g.VM_default_mappings = 0
		vim.g.VM_maps = {
			["Find Under"] = "",
		}
		vim.g.VM_add_cursor_at_pos_no_mappings = 1
	end,
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>ma", "<Plug>(VM-Select-All)<Tab>", { desc = "Select all" })
		keymap.set("n", "<leader>mr", "<Plug>(VM-Start-Regex-Search)", { desc = "Start regex search" })
		keymap.set("n", "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)", { desc = "Add cursor at position" })
		keymap.set("v", "<leader>mv", "<Plug>(VM-Visual-Cursors)", { desc = "Visual cursor with delay" })
		keymap.set("n", "<leader>mo", "<Plug>(VM-Toggle-Mappings)", { desc = "Toggle Mappings" })
	end,
}
