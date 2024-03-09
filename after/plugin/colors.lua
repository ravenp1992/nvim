-- require("catppuccin").setup({
-- 	flavour = "macchiato", -- latte, frappe, macchiato, mocha
-- 	transparent_background = true, -- disables setting the background color.
-- 	color_overrides = {
-- 		macchiato = {
-- 			teal = "#228B22",
-- 			pinkGray = "#E7DADA",
-- 			comment = "#8F8A93",
-- 		},
-- 	},
-- 	custom_highlights = function(colors)
-- 		return {
-- 			LineNr = { fg = colors.overlay2 },
-- 			-- Comment = { fg = colors.overlay0 },
-- 			Comment = { fg = colors.comment },
-- 		}
-- 	end,
-- })

require("tokyonight").setup({
	style = "moon",
	-- on_colors = function(colors)
	-- 	colors.comment = colors.comment
	-- end,
	on_highlights = function(hl, c)
		hl.LineNr = {
			fg = c.dark3,
		}
		hl.CursorLineNr = {
			fg = c.teal,
		}
	end,
	-- transparent = true,
})

-- setup must be called before loading
vim.cmd.colorscheme("tokyonight-moon")

-- require("nightfox").setup({
-- 	options = {
-- 		transparent = true,
-- 		styles = {
-- 			comments = "italic",
-- 			keywords = "bold",
-- 			types = "italic,bold",
-- 		},
-- 	},
-- })

-- require("dracula").setup({
-- 	transparent_bg = true,
-- 	overrides = function(colors)
-- 		return {
-- 			CursorLineNr = { fg = colors.yellow },
-- 		}
-- 	end,
-- })

-- vim.cmd.colorscheme("dracula")
