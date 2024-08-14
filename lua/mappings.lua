require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>so", ":TSLspOrganize<CR>", {desc = "TSLspOrganize"})
map("n", "<leader>sr", ":TSLspRenameFile<CR>", {desc = "TSLspRenameFile"})
map("n", "<leader>si", ":TSLspImportAll<CR>", {desc = "TSLspImportAll"})

map("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

map("n", "<leader>tf", ":TestFile<CR>", { desc = "TestFile" })
map("n", "<leader>tn", ":TestNearest<CR>", { desc = "TestNearest" })
map("n", "<leader>ti", ":TestInfo<CR>", { desc = "TestInfo" })
map("n", "<leader>tl", ":TestLast<CR>", { desc = "TestLast" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
