require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- Keyboard users
map("n", "<C-t>", function()
  require("menu.utils").delete_old_menus()
  require("menu").open "default"
end, {})

-- mouse users + nvimtree users!
map("n", "<RightMouse>", function()
  require("menu.utils").delete_old_menus()
  vim.cmd.exec '"normal! \\<RightMouse>"'
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

map("n", "<leader>lg", ":LazyGit<CR>", { desc = "LazyGit" })
map("n", "<leader>lr", ":LspRestart<CR>", { desc = "LspRestart" })
map("n", "<leader>lt", ":LenslineToggle<CR>", { desc = "LenslineToggle" })

-- lsp
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { desc = "LSP Code Action", silent = true })
map("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", { desc = "LSP go to definition", silent = true })
-- telescope
map("n", "<leader>fd", "<cmd>Telescope lsp_definitions<CR>", { desc = "telescope find definitions" })
map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "telescope find references" })

-- neotest
map(
  "n",
  "<leader>tn",
  ":lua require('neotest').run.run({ vitestCommand = './node_modules/.bin/vitest' })<CR>",
  { desc = "NeoTestRun Nearest", silent = true }
)
map(
  "n",
  "<leader>tf",
  ":lua require('neotest').run.run({ vim.fn.expand('%'), vitestCommand = './node_modules/.bin/vitest' })<CR>",
  { desc = "NeoTestRun File", silent = true }
)
map("n", "<leader>tb", ":lua require('neotest').run.stop()<CR>", { desc = "NeoTestStop", silent = true })
map("n", "<leader>ts", ":lua require('neotest').summary.toggle()<CR>", { desc = "NeoTestSummary", silent = true })
map("n", "<leader>tp", ":lua require('neotest').output_panel.toggle()<CR>", { desc = "NeoTestPanel", silent = true })
map("n", "<leader>to", ":lua require('neotest').output.open()<CR>", { desc = "NeoTestOutput", silent = true })

-- code runner
map("n", "<leader>rc", ":RunCode<CR>", { desc = "RunCode" })
map("n", "<leader>rf", ":RunFile<CR>", { desc = "RunFile" })

-- venv
map("n", "<leader>sv", ":VenvSelect<cr>", { desc = "VenvSelect" })

map("n", "<leader>du", ":DBUI<CR>", { desc = "DBUI" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--

-- kulala
map("n", "<M-[>", ":lua require('kulala').jump_prev()<CR>", { desc = "kulala jump_next", silent = true })
map("n", "<M-]>", ":lua require('kulala').jump_next()<CR>", { desc = "kulala jump_prev", silent = true })
map("n", "<M-CR>", ":lua require('kulala').run()<CR>", { desc = "kulala run", silent = true })
map("n", "<leader>co", ":lua require('kulala').copy()<CR>", { desc = "kulala copy", silent = true })
-- map("n", "<leader>cb", ":lua require('kulala').close()<cr>", { desc = "kulala close", silent = true })

-- dap
map("n", "<leader>dn", ":DapNew<CR>", { desc = "dap new", silent = true })
map("n", "<leader>db", ":DapToggleBreakpoint<CR>", { desc = "dap breakpoint", silent = true })
map("n", "<leader>do", ":DapStepOver<CR>", { desc = "dap step over", silent = true })
map("n", "<leader>di", ":DapStepInto<CR>", { desc = "dap step into", silent = true })

-- supermaven
map(
  "n",
  "<leader>st",
  ":lua require('supermaven-nvim.api').toggle()<CR>",
  { desc = "Supermaven Toggle", silent = true }
)

vim.g.VM_maps = {
  ["Find Under"] = "<M-n>",
  ["Find Subword Under"] = "<M-n>",
  ["Select All"] = "<M-a>",
  ["Skip Region"] = "<M-x>",
  ["Remove Region"] = "<M-p>",
}
