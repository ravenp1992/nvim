return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "biomejs", "prettierd" },
				typescript = { "biomejs", "prettierd" },
				javascriptreact = { "biomejs", "prettierd" },
				typescriptreact = { "biomejs", "prettierd" },
				svelte = { "biomejs", "prettierd" },
				css = { "biomejs", "prettierd" },
				html = { "biomejs", "prettierd" },
				json = { "biomejs", "prettierd" },
				yaml = { "biomejs", "prettierd" },
				markdown = { "biomejs", "prettierd" },
				python = { "ruff_format" },
				lua = { "stylua" },
				blade = { "blade-formatter" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
