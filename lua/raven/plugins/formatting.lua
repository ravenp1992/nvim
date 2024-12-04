return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				svelte = { "prettierd" },
				vue = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				graphql = { "prettierd" },
				liquid = { "prettierd" },
				lua = { "stylua" },
				python = { "ruff", "isort", "black" },
				php = { "pint" },
				blade = { "blade-formatter" },
				eruby = { "erb_format" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
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

-- return {
-- 	"stevearc/conform.nvim",
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	config = function()
-- 		local conform = require("conform")

-- 		local slow_format_filetypes = {}

-- 		conform.setup({
-- 			formatters_by_ft = {
-- 				javascript = { "prettierd" },
-- 				typescript = { "prettierd" },
-- 				javascriptreact = { "prettierd" },
-- 				typescriptreact = { "prettierd" },
-- 				svelte = { "prettierd" },
-- 				vue = { "prettierd" },
-- 				css = { "prettierd" },
-- 				html = { "prettierd" },
-- 				json = { "prettierd" },
-- 				yaml = { "prettierd" },
-- 				markdown = { "prettierd" },
-- 				python = { "ruff_format" },
-- 				lua = { "stylua" },
-- 				php = { "pint" },
-- 				blade = { "blade-formatter" },
-- 				eruby = { "erb-formatter" },
-- 			},
-- 			format_on_save = function(bufnr)
-- 				if slow_format_filetypes[vim.bo[bufnr].filetype] then
-- 					return
-- 				end
-- 				local function on_format(err)
-- 					if err and err:match("timeout$") then
-- 						slow_format_filetypes[vim.bo[bufnr].filetype] = true
-- 					end
-- 				end

-- 				return { timeout_ms = 1000, lsp_format = "fallback" }, on_format
-- 			end,

-- 			format_after_save = function(bufnr)
-- 				if not slow_format_filetypes[vim.bo[bufnr].filetype] then
-- 					return
-- 				end
-- 				return { lsp_format = "fallback" }
-- 			end,
-- 		})

-- 		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
-- 			conform.format({
-- 				lsp_fallback = true,
-- 				async = false,
-- 				timeout_ms = 1000,
-- 			})
-- 		end, { desc = "Format file or range (in visual mode)" })
-- 	end,
-- }
