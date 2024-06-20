local on_init = require("plugins.configs.lspconfig").on_init
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- if you just want default config for the servers then put them in a table
local servers = {
  html = {},
  cssls = {},
  tsserver = {},
  clangd = {},
  gopls = {},
  rust_analyzer = {},
  pyright = {},
  jsonls = {},
  prismals = {},
  emmet_ls = {},
  svelte = {},
}

for name, opts in pairs(servers) do
  opts.on_init = on_init
  opts.on_attach = on_attach
  opts.capabilities = capabilities

  require("lspconfig")[name].setup(opts)
end

require("custom.configs.nvimtest")
