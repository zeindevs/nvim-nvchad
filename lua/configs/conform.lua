local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff-format" },
    cmake = { "cmake-format" },
    typescript = { "biome" },
    javascript = { "biome" },
    css = { "biome" },
    json = { "biome" },
    html = { "prettier" },
    proto = { "buf" },
    asm = { "asmfmt" },
    ruby = { "rubyfmt" },
    tex = { "tex-fmt" },
    typ = { "typstyle" }
  },
  -- format_on_save = {
  --   --   -- These options will be passed to conform.format()
  --   timeout_ms = 1500,
  --   lsp_fallback = true,
  -- },
}
return options
