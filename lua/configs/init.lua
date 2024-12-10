require("nvim-test").setup {}

require("code_runner").setup {}

require("nvim-ts-autotag").setup {
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

-- local venv_selector = require "venv-selector"

require("venv-selector").setup {
  -- Your options go here
  name = ".venv",
  auto_refresh = true,
  stay_on_this_version = true,
  -- changed_venv_hooks = { venv_selector.hooks.pyright },
}

require("flutter-tools").setup {}

require("dap-go").setup {}

require("dapui").setup {}

require("render-markdown").setup {}

local dap, dapui = require("dap"), require("dapui")
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}
dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = "Select and attach to process",
    type = "gdb",
    request = "attach",
    program = function()
       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    pid = function()
       local name = vim.fn.input("Executable name (filter): ")
       return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = "${workspaceFolder}"
  },
  {
    name = "Attach to gdbserver :1234",
    type = "gdb",
    request = "attach",
    target = "localhost:1234",
    program = function()
       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}"
  },
}
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
