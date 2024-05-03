local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })

	-- override some defaut keymaps
	vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = bufnr })
	vim.keymap.set("n", "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = bufnr })
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
			"eruby",
			"blade",
			"dart",
		},
		["rust_analyzer"] = { "rust" },
		["gopls"] = { "go" },
		["prismals"] = { "prisma" },
		["intelephense"] = { "php" },
		["solargraph"] = { "ruby" },
	},
})

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.dart_format,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.erb_format,
		null_ls.builtins.formatting.blade_formatter,
	},
})

require("mason").setup({})
require("mason-lspconfig").setup({
	handlers = {
		function(name)
			lsp_zero.default_setup(name)
		end,
		volar = function()
			require("lspconfig").volar.setup({})
		end,
		tsserver = function()
			local vue_typescript_plugin = require("mason-registry")
				.get_package("vue-language-server")
				:get_install_path() .. "/node_modules/@vue/language-server" .. "/node_modules/@vue/typescript-plugin"

			require("lspconfig").tsserver.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_typescript_plugin,
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"vue",
				},
			})
		end,
		-- function(name)
		-- 	local lsp = require("lspconfig")[name]
		-- 	if require("neoconf").get(name .. ".disable") then
		-- 		return
		-- 	end
		-- 	if name == "volar" then
		-- 		lsp.filetypes = { "vue", "typescript", "javascript" }
		-- 	end
		-- 	lsp_zero.default_setup(name)
		-- end,
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
