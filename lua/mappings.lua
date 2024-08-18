require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>so", ":TSLspOrganize<CR>", { desc = "TSLspOrganize" })
map("n", "<leader>sr", ":TSLspRenameFile<CR>", { desc = "TSLspRenameFile" })
map("n", "<leader>si", ":TSLspImportAll<CR>", { desc = "TSLspImportAll" })

map("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

map("n", "<leader>te", ":TestEdit<CR>", { desc = "TestEdit" })
map("n", "<leader>ts", ":TestSuite<CR>", { desc = "TestSuite" })
map("n", "<leader>tv", ":TestVisit<CR>", { desc = "TestVisit" })
map("n", "<leader>tf", ":TestFile<CR>", { desc = "TestFile" })
map("n", "<leader>tn", ":TestNearest<CR>", { desc = "TestNearest" })
map("n", "<leader>ti", ":TestInfo<CR>", { desc = "TestInfo" })
map("n", "<leader>tl", ":TestLast<CR>", { desc = "TestLast" })

map("n", "<leader>vs", "<CMD>MCstart<CR>", { desc = "MCstart" })

map('n', '<leader>rc', ':RunCode<CR>', { desc = "RunCode" })
map('n', '<leader>rf', ':RunFile<CR>', { desc = "RunFile" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--

vim.api.nvim_set_keymap("n", "<C-k>", ":lua require('kulala').jump_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":lua require('kulala').jump_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":lua require('kulala').run()<CR>", { noremap = true, silent = true })
