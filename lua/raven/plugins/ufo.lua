return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		local ufo = require("ufo")

		local keymap = vim.keymap

		keymap.set("n", "zR", function()
			ufo.openAllFolds()
		end, { desc = "UFO open all folds" })

		keymap.set("n", "zM", function()
			ufo.closeAllFolds()
		end, { desc = "UFO close all folds" })

		-- keymap.set("n", "zr", function()
		-- 	ufo.openFoldsExceptKinds()
		-- end, { desc = "UFO open folds except kinds" })

		-- keymap.set("n", "zm", function()
		-- 	ufo.closeFoldsWith()
		-- end, { desc = "UFO open folds with" })

		keymap.set("n", "K", function()
			local winid = ufo.peekFoldedLinesUnderCursor()

			if not winid then
				vim.lsp.buf.hover()
			end
		end, { desc = "UFO peek folded lines" })

		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = (" 󰁂 %d "):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					-- str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end

		ufo.setup({
			fold_virt_text_handler = handler,
		})
	end,
}
