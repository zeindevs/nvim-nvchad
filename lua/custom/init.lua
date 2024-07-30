-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.templ" },
  callback = function()
    local file_name = vim.api.nvim_buf_get_name(0)
    vim.cmd(":silent !templ fmt " .. file_name)

    local bufnr = vim.api.nvim_get_current_buf()
    if vim.api.nvim_get_current_buf() == bufnr then
      vim.cmd('e!')
    end
  end
})
