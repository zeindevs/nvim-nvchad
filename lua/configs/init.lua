require("nvim-test").setup {}

require('code_runner').setup {}

require('nvim-ts-autotag').setup {
  opts = {
    -- Defaults
    enable_close = true,          -- Auto close tags
    enable_rename = true,         -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  -- per_filetype = {
  --   ["html"] = {
  --     enable_close = false
  --   }
  -- }
}
-- require("example").setup {
--   name = "Max"
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

-- local venv_selector = require 'venv-selector'

require('venv-selector').setup {
  -- Your options go here
  name = ".venv",
  auto_refresh = true,
  stay_on_this_version = true,
  -- changed_venv_hooks = { venv_selector.hooks.pyright },
}

require('dap-go').setup {}

require("dapui").setup {}

local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
