-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		require("tokyonight").setup()

-- 		vim.cmd.colorscheme("tokyonight")
-- 	end,
-- }

-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavour = "macchiato",
-- 			transparent_background = false,

-- 			custom_highlights = function(colors)
-- 				return {
-- 					LineNr = { fg = colors.overlay2 },
-- 				}
-- 			end,
-- 		})

-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- }

-- return {
-- 	"shaunsingh/nord.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("nord")
-- 	end,
-- }

-- return {
-- 	"fcancelinha/nordern.nvim",
-- 	branch = "master",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("nordern")
-- 	end,
-- }

-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("kanagawa").setup({
-- 			colors = {
-- 				theme = {
-- 					all = {
-- 						ui = {
-- 							bg_gutter = "none",
-- 						},
-- 					},
-- 				},
-- 			},
-- 		})

-- 		vim.cmd.colorscheme("kanagawa-wave")
-- 	end,
-- }

return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			variant = "moon",
			dark_variant = "moon",
		})

		vim.cmd.colorscheme("rose-pine")
	end,
}
