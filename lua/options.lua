require "nvchad.options"

-- add yours here!
require("nvim-test").setup {}
require("nvim-lsp-ts-utils").setup {}
require('code_runner').setup {}

-- require('multicursors').setup {
--     hint_config = false,
-- }
require("multicursors").setup {
  hint_config = {
    float_opts = {
      border = "rounded",
    },
    position = "middle-right",
  },
  generate_hints = {
    normal = true,
    insert = true,
    extend = true,
    config = {
      column_count = 1,
    },
  },
}

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.filetype.add {
  extension = {
    ["http"] = "http",
  },
}
