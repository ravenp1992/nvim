return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", opts = {} },
		{ "saghen/blink.cmp" },
	},
	config = function()
		local lspconfig = require("lspconfig")

		local mason_lspconfig = require("mason-lspconfig")

		local blink_cmp = require("blink.cmp")

		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("userLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		-- local capabilities = cmp_nvim_lsp.default_capabilities()
		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		local capabilities = blink_cmp.get_lsp_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local function add_ruby_deps_command(client, bufnr)
			vim.api.nvim_buf_create_user_command(bufnr, "ShowRubyDeps", function(opts)
				local params = vim.lsp.util.make_text_document_params()
				local showAll = opts.args == "all"

				client.request("rubyLsp/workspace/dependencies", params, function(error, result)
					if error then
						print("Error showing deps: " .. error)
						return
					end

					local qf_list = {}
					for _, item in ipairs(result) do
						if showAll or item.dependency then
							table.insert(qf_list, {
								text = string.format("%s (%s) - %s", item.name, item.version, item.dependency),
								filename = item.path,
							})
						end
					end

					vim.fn.setqflist(qf_list)
					vim.cmd("copen")
				end, bufnr)
			end, {
				nargs = "?",
				complete = function()
					return { "all" }
				end,
			})
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({})
			end,
			["ts_ls"] = function()
				local vue_typescript_plugin = require("mason-registry")
					.get_package("vue-language-server")
					:get_install_path() .. "/node_modules/@vue/language-server" .. "/node_modules/@vue/typescript-plugin"

				-- configure svelte server
				lspconfig["ts_ls"].setup({
					capabilities = capabilities,
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
			["svelte"] = function()
				-- configure svelte server
				lspconfig["svelte"].setup({
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.js", "*.ts" },
							callback = function(ctx)
								-- Here use ctx.match instead of ctx.file
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
							end,
						})
					end,
				})
			end,
			["emmet_language_server"] = function()
				-- configure emmet language server
				lspconfig["emmet_language_server"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
						"blade",
						"heex",
						"vue",
					},
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["ruby_lsp"] = function()
				-- configure lua server (with special settings)
				lspconfig["ruby_lsp"].setup({
					cmd = { vim.fn.expand("~/.local/share/mise/installs/ruby/3.3.5/bin/ruby-lsp") },
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						add_ruby_deps_command(client, bufnr)
					end,
				})
			end,
			["lexical"] = function()
				-- configure lua server (with special settings)
				lspconfig["lexical"].setup({
					-- capabilities = capabilities,
					filetypes = { "elixir", "eelixir", "heex" },
					cmd = { "/Users/ravenparagas/lsp/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
				})
			end,
		})
	end,
}
