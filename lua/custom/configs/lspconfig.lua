local lspconfig = require('lspconfig')
local nvlsp = require("plugins.configs.lspconfig")

local servers = {
  html = {
    filetypes = { "html" }
  },
  cssls = {},
  tsserver = {},
  clangd = {},
  gopls = {},
  rust_analyzer = {},
  zls = {},
  pyright = {},
  jsonls = {},
  prismals = {},
  emmet_ls = {
    filetypes = { "html", "astro" }
  },
  svelte = {},
  templ = {}
}

for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities
  lspconfig[name].setup(opts)
end

require('nvim-lsp-ts-utils').setup {}
require("nvim-test").setup {}
