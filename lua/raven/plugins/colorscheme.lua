-- return {
-- 	"sontungexpt/witch",
-- 	priority = 1000,
-- 	lazy = false,
-- 	config = function(_, opts)
-- 		require("witch").setup({
-- 			dim_inactive = {
-- 				enabled = true,
-- 				-- from 0 to 1
-- 				-- as nearer to 1 the dimming will be lighter
-- 				level = 0.9,
-- 			},
-- 		})
-- 	end,
-- }

-- return {
-- 	"olivercederborg/poimandres.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("poimandres").setup({
-- 			-- leave this setup function empty for default config
-- 			-- or refer to the configuration section
-- 			-- for configuration options
-- 		})
-- 	end,

-- 	-- optionally set the colorscheme within lazy config
-- 	init = function()
-- 		vim.cmd("colorscheme poimandres")
-- 	end,
-- }

-- return {
-- 	"AlexvZyl/nordic.nvim",
-- 	priority = 1000,
-- 	lazy = false,
-- 	config = function()
-- 		require("nordic").load()
-- 	end,
-- }

-- return {
-- 	"Yazeed1s/oh-lucy.nvim",
-- 	priority = 1000,
-- 	lazy = false,
-- 	config = function()
-- 		vim.cmd.colorscheme("oh-lucy")
-- 	end,
-- }

-- return {
-- 	"eldritch-theme/eldritch.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		vim.cmd.colorscheme("eldritch")
-- 	end,
-- }

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
