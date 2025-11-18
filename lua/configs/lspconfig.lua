-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- EXAMPLE
local servers = {
  html = {
    filetypes = { "html", "ejs" },
  },
  cssls = {},
  gopls = {},
  rust_analyzer = {},
  intelephense = {},
  zls = {},
  clangd = {
    filetypes = { "c", "cpp" },
  },
  -- emmet_ls = {},
  pyright = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { "*" },
      },
    },
  },
  -- basedpyright = {
  --   typeCheckingMode = "basic"
  -- },
  ruff = {},
  ts_ls = {},
  prismals = {},
  -- java_language_server = {
  --   cmd = { "/home/zeindevs/.local/share/nvim/mason/bin/java-language-server" }
  -- },
  -- kotlin_language_server = {},
  omnisharp = {
    cmd = { "OmniSharp" }, -- or the full path if not in PATH
    enable_editorconfig_support = true,
    enable_ms_build_load_projects_on_demand = true,
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true,
    sdk_include_prereleases = true,
    analyze_open_documents_only = false,
  },
  bashls = {},
  svelte = {},
  cmake = {},
  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },
  templ = {},
  -- slint_lsp = {
  --   cmd = { "slint-lsp" },
  --   filetypes = { "slint" },
  -- },
  buf_ls = {},
  asm_lsp = {},
  ols = {},
  biome = {},
  ruby_lsp = {},
  -- elixirls = {
  -- cmd = { "/home/zeindevs/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
  -- },
  qmlls = {
    cmd = { "qmlls" },
    filetypes = { "qml" },
  },
}

local nvlsp = require "nvchad.configs.lspconfig"

for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities
  vim.lsp.enable(name)
  vim.lsp.config(name, opts)
end

vim.diagnostic.config { virtual_text = false }
