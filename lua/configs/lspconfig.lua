-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- EXAMPLE
local servers = {
  html = {
    filetypes = { "html", "ejs" },
  },
  -- cssls = {},
  gopls = {},
  rust_analyzer = {},
  intelephense = {},
  zls = {},
  clangd = {
    filetypes = { "c", "cpp", "ino" },
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
  -- jdtls = {},
  -- kotlin_language_server = {},
  omnisharp = {
    cmd = { "OmniSharp" }, -- or the full path if not in PATH
  },
  bashls = {},
  -- svelte = {},
  cmake = {},
  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },
  yamlls = {},
  templ = {},
  slint_lsp = {},
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
  glsl_analyzer = {},
  texlab = {},
  tinymist = {},
  mini_ls = {
    cmd = { "mini_ls" },
    filetypes = { "mini" },
  },
  vala_ls = {},
  dockerls = {}
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
