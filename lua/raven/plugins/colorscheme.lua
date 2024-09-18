return {
	-- "0xstepit/flow.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- opts = {},
	-- config = function()
	-- 	require("flow").setup({
	-- 		transparent = true,
	-- 	})

	-- 	vim.cmd.colorscheme("flow")
	-- end,

	-- "rose-pine/neovim",
	-- name = "rose-pine",
	-- priority = 1000,
	-- config = function()
	-- 	require("rose-pine").setup({
	-- 		variant = "moon",
	-- 		dark_variant = "moon",

	-- 		styles = {
	-- 			transparency = true,
	-- 		},
	-- 	})

	-- 	vim.cmd.colorscheme("rose-pine-moon")
	-- end,

	-- "folke/tokyonight.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- opts = {},
	-- config = function()
	-- 	require("tokyonight").setup({
	-- 		style = "storm",
	-- 		transparent = true,
	-- 		styles = {
	-- 			sidebars = "transparent",
	-- 			floats = "transparent",
	-- 		},
	-- 		on_colors = function(colors)
	-- 			colors.comment = colors.dark5
	-- 			colors.fg_gutter = colors.dark3
	-- 		end,
	-- 	})

	-- 	vim.cmd.colorscheme("tokyonight-storm")
	-- end,

	-- "scottmckendry/cyberdream.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	require("cyberdream").setup({
	-- 		transparent = true,
	-- 		extensions = {
	-- 			telescope = false,
	-- 		},
	-- 	})

	-- 	vim.cmd.colorscheme("cyberdream")
	-- end,

	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nightfox").setup({
			options = {
				transparent = true,
			},
		})

		vim.cmd("colorscheme nightfox")
	end,

	-- "projekt0n/github-nvim-theme",
	-- lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- priority = 1000, -- make sure to load this before all the other start plugins
	-- config = function()
	-- 	require("github-theme").setup({
	-- 		options = {
	-- 			transparent = true,
	-- 		},
	-- 	})

	-- 	vim.cmd("colorscheme github_dark_dimmed")
	-- end,

	-- "binhtran432k/dracula.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	local colorscheme = require("dracula")

	-- 	colorscheme.setup({
	-- 		transparent = true,

	-- 		styles = {
	-- 			sidebars = "transparent",
	-- 			floats = "transparent",
	-- 		},

	-- 		on_colors = function(colors)
	-- 			-- colors.comment = colors.green
	-- 		end,
	-- 	})

	-- 	vim.cmd.colorscheme("dracula")
	-- end,

	-- "catppuccin/nvim",
	-- name = "catppuccin",
	-- priority = 1000,
	-- config = function()
	-- 	local colorscheme = require("catppuccin")

	-- 	colorscheme.setup({
	-- 		flavour = "macchiato",
	-- 		transparent_background = true,
	-- 	})

	-- 	vim.cmd.colorscheme("catppuccin-macchiato")
	-- end,

	-- "f4z3r/gruvbox-material.nvim",
	-- name = "gruvbox-material",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	require("gruvbox-material").setup({
	-- 		italics = true, -- enable italics in general
	-- 		contrast = "medium", -- set contrast, can be any of "hard", "medium", "soft"
	-- 		comments = {
	-- 			italics = true, -- enable italic comments
	-- 		},
	-- 		background = {
	-- 			transparent = true, -- set the background to transparent
	-- 		},
	-- 		float = {
	-- 			force_background = false, -- force background on floats even when background.transparent is set
	-- 			background_color = nil, -- set color for float backgrounds. If nil, uses the default color set
	-- 			-- by the color scheme
	-- 		},
	-- 		signs = {
	-- 			highlight = true, -- whether to highlight signs
	-- 		},
	-- 		customize = nil, -- customize the theme in any way you desire, see below what this
	-- 		-- configuration accepts
	-- 	})
	-- end,
}
