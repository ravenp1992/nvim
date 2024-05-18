local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- lsp-zero
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},

	-- react snippets
	{
		"mlaursen/vim-react-snippets",
	},

	-- formatting
	{
		"stevearc/conform.nvim",
		opts = {},
	},

	-- linting
	{
		"mfussenegger/nvim-lint",
	},

	-- vim-tmux-navigator
	{ "christoomey/vim-tmux-navigator" },

	-- colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				view = {
					side = "right",
					width = 30,
				},
				filters = {
					git_ignored = false,
				},
				update_focused_file = {
					enable = true,
				},
			})
		end,
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},

	-- undotree
	{
		"mbbill/undotree",
	},

	-- neoscroll
	{
		"karb94/neoscroll.nvim",
	},

	-- git
	{
		"tanvirtin/vgit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- comment
	{
		"numToStr/Comment.nvim",
		opts = {
			ignore = "^$",
		},
		lazy = false,
	},

	{
		"JoosepAlviste/nvim-ts-context-commentstring",
	},

	-- autopair
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	-- surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- tabline
	{
		"seblj/nvim-tabline",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"norcalli/nvim-colorizer.lua",
	},

	-- markdown-preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- code-runner
	{ "CRAG666/code_runner.nvim", config = true },

	-- laravel
	{
		"noahfrederick/vim-laravel",
		dependencies = {
			"tpope/vim-dispatch",
			"tpope/vim-projectionist",
			"noahfrederick/vim-composer",
		},
	},

	-- {
	-- 	"tpope/vim-rails",
	-- },

	-- {
	-- 	"barrett-ruth/live-server.nvim",
	-- 	build = "npm add -g live-server",
	-- 	cmd = { "LiveServerStart", "LiveServerStop" },
	-- 	config = true,
	-- },

	-- {
	-- 	"github/copilot.vim",
	-- },

	-- {
	-- 	"akinsho/flutter-tools.nvim",
	-- 	lazy = false,
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"stevearc/dressing.nvim", -- optional for vim.ui.select
	-- 	},
	-- },

	-- {
	-- 	"wa11breaker/flutter-bloc.nvim",
	-- },
}

require("lazy").setup(plugins, {})
