require("code_runner").setup({
	filetype = {
		-- javascript = {
		-- 	"cd $dir &&",
		-- 	"node $fileName",
		-- },
		javascript = "bun run",
		typescript = "bun run",
		php = {
			"cd $dir &&",
			"php $fileName",
		},
		go = {
			"go run",
		},
		ruby = {
			"cd $dir &&",
			"ruby $fileName",
		},
		dart = {
			"cd $dir &&",
			"dart $fileName",
		},
	},
})
