-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  html = {
    filetypes = { "html" }
  },
  cssls = {},
  gopls = {},
  rust_analyzer = {},
  intelephense = {},
  zls = {},
  clangd = {},
  -- emmet_ls = {},
  pyright = {},
  ts_ls = {},
  prismals = {},
  kotlin_language_server = {},
  csharp_ls= {},
  bashls= {},
  svelte = {},
  -- basedpyright = {
  --   typeCheckingMode = "basic"
  -- },
  cmake = {},
  jsonls = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true }
      }
    }
  },
  templ = {}
}

local nvlsp = require "nvchad.configs.lspconfig"

for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities
  lspconfig[name].setup(opts)
end

-- lsps with default config
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

require("configs.init")
