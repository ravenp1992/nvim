require("catppuccin").setup({
  flavour = "macchiato",         -- latte, frappe, macchiato, mocha
  transparent_background = true, -- disables setting the background color.
  -- color_overrides = {
  -- 	macchiato = {
  -- 		teal = "#228B22",
  -- 		pinkGray = "#E7DADA",
  -- 		comment = "#8F8A93",
  -- 	},
  -- },
  -- custom_highlights = function(colors)
  -- 	return {
  -- 		LineNr = { fg = colors.overlay2 },
  -- 		-- Comment = { fg = colors.overlay0 },
  -- 		Comment = { fg = colors.comment },
  -- 	}
  -- end,
})
vim.cmd.colorscheme("catppuccin")
