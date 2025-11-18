local cmp = require "cmp"
local lspkind = require "lspkind"

cmp.setup {
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = lspkind.cmp_format {
      mode = "symbol_text", -- show symbol + text
      maxwidth = 50,
      ellipsis_char = "...",
      show_labelDetails = true,
      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snip]",
        nvim_lua = "[Lua]",
        path = "[Path]",
      },
    },
  },
}
