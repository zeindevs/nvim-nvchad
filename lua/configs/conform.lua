local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff-format" },
    cmake = { "cmake-format" },
    typescript = { "biome" },
    javascript = { "biome" },
    css = { "biome" },
    json = { "biome" },
    html = { "biome" },
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
