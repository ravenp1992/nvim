-- vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ex", vim.cmd.NvimTreeToggle)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("x", "<leader>p", '"_dP')

--vim.keymap.set("n", "<leader>y", '"+y')
--vim.keymap.set("v", "<leader>y", '"+y')
--vim.keymap.set("n", "<leader>Y", '"+Y')

-- vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
-- vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
-- vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
-- vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
-- vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
-- vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
-- vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })

-- flutter
-- vim.keymap.set("n", "<leader>fr", ":FlutterRun<CR>", { noremap = true, silent = false })
-- vim.keymap.set("n", "<leader>frt", ":FlutterRestart<CR>", { noremap = true, silent = false })
-- vim.keymap.set("n", "<leader>frl", ":FlutterReload<CR>", { noremap = true, silent = false })
-- vim.keymap.set("n", "<leader>flc", ":FlutterLogClear<CR>", { noremap = true, silent = false })
-- vim.keymap.set("n", "<leader>fq", ":FlutterQuit<CR>", { noremap = true, silent = false })

-- flutter bloc
-- vim.keymap.set("n", "<leader>fcb", ":FlutterCreateBloc<CR>", { noremap = true, silent = false })
-- vim.keymap.set("n", "<leader>fcc", ":FlutterCreateCubit<CR>", { noremap = true, silent = false })
