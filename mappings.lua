---@type MappingsTable
local M = {}

M.general = {
  i = {
    -- backspace word
    ["<C-BS>"] = { "<C-W>", "Backspace word", opts = { noremap = true } },
  },
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    -- tslsp
    ['<leader>fs'] = { ":TSLspOrganize<CR>", "TSLspOrganize", opts = { silent = true } },
    ['<leader>fr'] = { ":TSLspRenameFile<CR>", "TSLspRenameFile", opts = { silent = true } },
    ['<leader>fi'] = { ":TSLspImportAll<CR>", "TSLspImportAll", opts = { silent = true } },

    -- lazygit
    ['<leader>lg'] = { "<cmd>LazyGit<cr>", "LazyGit" },

    -- nvim-test
    ['<leader>tf'] = { ":TestFile<CR>", "TestFile" },
    ['<leader>tn'] = { ":TestNearest<CR>", "TestNearest" },
    ['<leader>ti'] = { ":TestInfo<CR>", "TestInfo" },
    ['<leader>tl'] = { ":TestLast<CR>", "TestLast" },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
