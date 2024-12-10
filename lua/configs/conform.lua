local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff-format" },
    cmake = { "cmake-format" },
    typescript = { "prettierd" },
    javascript = { "prettierd" },
    css = { "prettierd" },
    json = { "prettierd" },
    html = { "prettierd" },
    proto = { "buf" },
    asm = { "asmfmt" },
  },

  format_on_save = {
    --   -- These options will be passed to conform.format()
    timeout_ms = 1500,
    lsp_fallback = true,
  },
}

return options
