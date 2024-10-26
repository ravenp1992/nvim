return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
			transparent_background = false,

			custom_highlights = function(colors)
				return {
					LineNr = { fg = colors.overlay2 },
				}
			end,
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}

-- return {
-- 	-- add dracula
-- 	"Mofiqul/dracula.nvim",
-- 	name = "dracula",
-- 	priority = 1000,
-- 	config = function()
-- 		require("dracula").setup({
-- 			colors = {
-- 				bg = "#073642",
-- 			},
-- 		})

-- 		vim.cmd.colorscheme("dracula")
-- 	end,
-- }

-- return {
-- 	"EdenEast/nightfox.nvim",
-- 	name = "nighfox",
-- 	priority = 1000,
-- 	config = function()
-- 		require("nightfox").setup({})

-- 		vim.cmd.colorscheme("nightfox")
-- 	end,
-- }
-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		require("tokyonight").setup({

-- 			on_colors = function(colors)
-- 				colors.LineNr = colors.dark3
-- 			end,
-- 		})

-- 		vim.cmd.colorscheme("tokyonight-storm")
-- 	end,
-- }

-- return {
-- 	"maxmx03/solarized.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		---@type solarized
-- 		local solarized = require("solarized")
-- 		solarized.setup({
-- 			variant = "summer",
-- 		})
-- 		vim.cmd.colorscheme("solarized")
-- 	end,
-- }

-- return {
-- 	"shaunsingh/solarized.nvim",
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		require("solarized").set()

-- 		vim.cmd.colorscheme("solarized")
-- 	end,
-- }

-- return {
-- 	"0xstepit/flow.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		require("flow").setup({
-- 			dark_theme = true,
-- 			transparent = false,
-- 			high_contrast = false,
-- 			fluo_color = "pink",
-- 			mode = "desaturate",
-- 			aggressive_spell = false,
-- 		})
-- 		vim.cmd("colorscheme flow")
-- 	end,
-- }
