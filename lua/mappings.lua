require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { desc = "LSP Code Action", silent = true })
map("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", { desc = "LSP go to definition", silent = true })
map("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

-- map("n", "<leader>te", ":TestEdit<CR>", { desc = "TestEdit" })
-- map("n", "<leader>ts", ":TestSuite<CR>", { desc = "TestSuite" })
-- map("n", "<leader>tv", ":TestVisit<CR>", { desc = "TestVisit" })
-- map("n", "<leader>tf", ":TestFile<CR>", { desc = "TestFile" })
-- map("n", "<leader>tn", ":TestNearest<CR>", { desc = "TestNearest" })
-- map("n", "<leader>ti", ":TestInfo<CR>", { desc = "TestInfo" })
-- map("n", "<leader>tl", ":TestLast<CR>", { desc = "TestLast" })


map("n", "<leader>tn", ":lua require('neotest').run.run({ vitestCommand = './node_modules/.bin/vitest' })<CR>",
  { desc = "NeoTestRun Nearest", silent = true })
map("n", "<leader>tf",
  ":lua require('neotest').run.run({ vim.fn.expand('%'), vitestCommand = './node_modules/.bin/vitest' })<CR>",
  { desc = "NeoTestRun File", silent = true })
map("n", "<leader>tb", ":lua require('neotest').run.stop()<CR>", { desc = "NeoTestStop", silent = true })
map("n", "<leader>ts", ":lua require('neotest').summary.toggle()<CR>", { desc = "NeoTestSummary", silent = true })
map("n", "<leader>tp", ":lua require('neotest').output_panel.toggle()<CR>", { desc = "NeoTestPanel", silent = true })
map("n", "<leader>to", ":lua require('neotest').output.open()<CR>", { desc = "NeoTestOutput", silent = true })

map("n", "<leader>ms", "<cmd>MCstart<CR>", { desc = "MCstart" })

map("n", "<leader>rc", ":RunCode<CR>", { desc = "RunCode" })
map("n", "<leader>rf", ":RunFile<CR>", { desc = "RunFile" })

map("n", '<leader>vs', '<cmd>VenvSelect<cr>')
map("n", '<leader>vc', '<cmd>VenvSelectCached<cr>')

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--

map("n", "<M-[>", ":lua require('kulala').jump_prev()<CR>", { desc = "kulala jump_next", silent = true })
map("n", "<M-]>", ":lua require('kulala').jump_next()<CR>", { desc = "kulala jump_prev", silent = true })
map("n", "<M-CR>", ":lua require('kulala').run()<CR>", { desc = "kulala run", silent = true })
map("n", "<leader>co", ":lua require('kulala').copy()<CR>", { desc = "kulala copy", silent = true })
-- map("n", "<leader>cb", ":lua require('kulala').close()<cr>", { desc = "kulala close", silent = true })

map('n', '<leader>db', ":lua require('dap').toggle_breakpoint()<CR>", { desc = "dap breakpoint", silent = true })
map('n', '<leader>dc', ":lua require('dap').continue()<CR>", { desc = "dap continue", silent = true })
map('n', '<leader>dn', ":lua require('dap').step_over()<CR>", { desc = "dap step over", silent = true })

-- Keyboard users
map("n", "<C-t>", function()
  require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
map("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})
