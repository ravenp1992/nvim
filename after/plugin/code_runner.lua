require("code_runner").setup({
	filetype = {
		-- javascript = {
		-- 	"cd $dir &&",
		-- 	"node $fileName",
		-- },
		javascript = "bun run",
		typescript = "bun run",
	},
})
