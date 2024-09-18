return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-neotest/neotest-go",
		-- "olimorris/neotest-phpunit",
		"V13Axel/neotest-pest",
	},
	config = function()
		-- get neotest namespace (api call creates or returns namespace)
		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)
		require("neotest").setup({
			-- your neotest config here
			adapters = {
				require("neotest-go"),
				-- require("neotest-phpunit"),
				require("neotest-pest"),
			},
		})

		local keymap = vim.keymap

		keymap.set(
			"n",
			"<leader>tr",
			":lua require('neotest').run.run()<CR>",
			{ noremap = true, silent = false, desc = "Neotest run the nearest test" }
		)
		keymap.set(
			"n",
			"<leader>tf",
			":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
			{ noremap = true, silent = false, desc = "Neotest run the current file" }
		)
		keymap.set(
			"n",
			"<leader>ta",
			":lua require('neotest').run.run(vim.fn.getcwd())<CR>",
			{ noremap = true, silent = false, desc = "Neotest full tetst suite run" }
		)
		keymap.set(
			"n",
			"<leader>tt",
			":lua require('neotest').run.stop()<CR>",
			{ noremap = true, silent = false, desc = "Neotest stop the nearest test" }
		)
		keymap.set(
			"n",
			"<leader>ts",
			":lua require('neotest').summary.toggle()<CR>",
			{ noremap = true, silent = false, desc = "Neotest toggle test summary" }
		)
		keymap.set(
			"n",
			"<leader>to",
			":lua require('neotest').output.open()<CR>",
			{ noremap = true, silent = false, desc = "Neotest display output per-test" }
		)
		keymap.set(
			"n",
			"<leader>tp",
			":lua require('neotest').output_panel.toggle()<CR>",
			{ noremap = true, silent = false, desc = "Neotest toggle the output panel" }
		)
		keymap.set(
			"n",
			"[n",
			":lua require('neotest').jump.prev({ status = 'failed' })<CR>",
			{ noremap = true, silent = false, desc = "Neotest go to previous failed test" }
		)
		keymap.set(
			"n",
			"]n",
			":lua require('neotest').jump.next({ status = 'failed' })<CR>",
			{ noremap = true, silent = false, desc = "Neotest go to next failed test" }
		)
	end,
}
