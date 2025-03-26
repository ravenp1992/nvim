return {
	"CRAG666/code_runner.nvim",
	config = function()
		local coderunner = require("code_runner")

		coderunner.setup({
			filetype = {
				python = "python3 -u",
				go = {
					"cd $dir &&",
					"go run $fileName",
				},
				odin = {
					"cd $dir &&",
					"odin run $fileName -file",
				},
				php = {
					"cd $dir &&",
					"php $fileName",
				},
				ruby = {
					"cd $dir &&",
					"ruby $fileName",
				},
				typescript = {
					"cd $dir &&",
					"bun run $fileName",
				},
				javascript = {
					"cd $dir &&",
					"node $fileName",
				},
				elixir = {
					"cd $dir &&",
					"elixir $fileName",
				},
			},
		})

		local keymap = vim.keymap

		-- keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false, desc = "CodeRunner run code" })
		keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false, desc = "CodeRunner run file" })
		-- keymap.set(
		-- 	"n",
		-- 	"<leader>rft",
		-- 	":RunFile tab<CR>",
		-- 	{ noremap = true, silent = false, desc = "CodeRunner run file tab" }
		-- )
		keymap.set(
			"n",
			"<leader>rp",
			":RunProject<CR>",
			{ noremap = true, silent = false, desc = "CodeRunner run project" }
		)
		keymap.set(
			"n",
			"<leader>rc",
			":RunClose<CR>",
			{ noremap = true, silent = false, desc = "CodeRunner close runner" }
		)
		-- keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
		-- keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
	end,
}
