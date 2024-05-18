local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })

	vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = bufnr })
	vim.keymap.set("n", "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"html",
		"emmet_language_server",
		"cssls",
		"tailwindcss",
		"svelte",
		"lua_ls",
		"prismals",
		"intelephense",
		"rust_analyzer",
		"jsonls",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

local cmp = require("cmp")
local cmp_format = require("lsp-zero").cmp_format({ details = true })

cmp.setup({
	preselect = true,
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
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

require("vim-react-snippets").lazy_load()
-- require("luasnip.loaders.from_vscode").lazy_load()
