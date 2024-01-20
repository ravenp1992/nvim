local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })

	-- override some defaut keymaps
	vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = bufnr })
	vim.keymap.set("n", "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = bufnr })

	-- lsp_zero.buffer_autoformat()
end)

lsp_zero.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"svelte",
			"css",
			"scss",
			"less",
			"html",
			"json",
			"jsonc",
			"yaml",
			"markdown",
			"markdown.mdx",
			"lua",
			"python",
		},
		["rust_analyzer"] = { "rust" },
		["gopls"] = { "go" },
		["intelephense"] = { "php" },
		["prismals"] = { "prisma" },
	},
})

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.black,
	},
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
		emmet_language_server = function()
			require("lspconfig").emmet_language_server.setup({
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"pug",
					"typescriptreact",
					"svelte",
				},
				-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
				-- **Note:** only the options listed in the table are supported.
				init_options = {
					--- @type string[]
					excludeLanguages = {},
					--- @type string[]
					extensionsPath = {},
					--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
					preferences = {},
					--- @type boolean Defaults to `true`
					showAbbreviationSuggestions = true,
					--- @type "always" | "never" Defaults to `"always"`
					showExpandedAbbreviation = "always",
					--- @type boolean Defaults to `false`
					showSuggestionsAsSnippets = false,
					--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
					syntaxProfiles = {},
					--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
					variables = {},
				},
			})
		end,
	},
})

local cmp = require("cmp")
local cmp_format = require("lsp-zero").cmp_format()

cmp.setup({
	preselect = true,
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
	confirmation = {
		completeopt = "menu,menuone,noinsert",
	},
	formatting = cmp_format,
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
})

require("luasnip.loaders.from_vscode").lazy_load()
