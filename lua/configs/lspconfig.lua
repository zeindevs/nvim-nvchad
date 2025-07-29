-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  html = {
    filetypes = { "html", "ejs" }
  },
  cssls = {},
  gopls = {},
  rust_analyzer = {},
  intelephense = {},
  zls = {},
  clangd = {
    filetypes = { "c", "cpp" }
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
        ignore = { '*' },
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
  csharp_ls = {},
  bashls = {},
  svelte = {},
  cmake = {},
  jsonls = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true }
      }
    }
  },
  templ = {},
  slint_lsp = {
    cmd = { "slint-lsp" },
    filetypes = { "slint" },
  },
  buf_ls = {},
  asm_lsp = {},
  ols = {},
  biome = {},
}

local nvlsp = require "nvchad.configs.lspconfig"

for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities
  lspconfig[name].setup(opts)
end

vim.diagnostic.config({ virtual_text = false })

require("configs.init")
