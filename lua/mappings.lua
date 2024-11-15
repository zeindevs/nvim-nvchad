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

map("n", "<leader>ms", "<CMD>MCstart<CR>", { desc = "MCstart" })

map("n", "<leader>rc", ":RunCode<CR>", { desc = "RunCode" })
map("n", "<leader>rf", ":RunFile<CR>", { desc = "RunFile" })

map("n", '<leader>vs', '<cmd>VenvSelect<cr>')
map("n", '<leader>vc', '<cmd>VenvSelectCached<cr>')

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--

vim.api.nvim_set_keymap("n", "<M-[>", ":lua require('kulala').jump_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-]>", ":lua require('kulala').jump_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-CR>", ":lua require('kulala').run()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>lua require('kulala').copy()<cr>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>cb", "<cmd>lua require('kulala').close()<cr>", { noremap = true, silent = true })

-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
  require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Auto select virtualenv Nvim open',
  pattern = '*',
  callback = function()
    local venv = vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
    if venv ~= '' then
      require('venv-selector').retrieve_from_cache()
    end
  end,
  once = true,
})