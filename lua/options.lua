require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.filetype.add {
  extension = {
    ["http"] = "http",
    ["slint"] = "slint",
  },
}

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf })
--   end,
-- })

-- vim.api.nvim_create_autocmd('VimEnter', {
--   desc = 'Auto select virtualenv Nvim open',
--   pattern = '*',
--   callback = function()
--     local venv = vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
--     if venv ~= '' then
--       require('venv-selector').retrieve_from_cache()
--     end
--   end,
--   once = true,
-- })
