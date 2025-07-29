return {
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- jsonls schemastore
  {
    "b0o/schemastore.nvim",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "http",
        "css",
        "go",
        "rust",
        "c",
        "cpp",
        "zig",
        "php",
        "blade",
        "python",
        "svelte",
        "typescript",
        "javascript",
      },

      -- highlight= {
      --   enable = true,
      -- }

      -- autotag = {
      --   enable = true,
      -- },

      -- indent = {
      --   enable = true,
      -- }
    },
    config = function(_, opts)
      vim.filetype.add {
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      }
      require("nvim-treesitter.configs").setup(opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
    end,
  },

  -- Test Runner for neovim
  -- {
  --   "klen/nvim-test",
  --   opts = require "configs.nvimtest",
  -- },

  -- lazygit
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with "keys" is recommended in
    -- order to load the plugin when the command is run for the first time
    -- keys = {
    --   { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    -- }
  },

  -- multicursors
  -- {
  --   "smoka7/multicursors.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "nvimtools/hydra.nvim",
  --   },
  --   opts = {},
  --   cmd = {
  --     "MCstart",
  --     "MCvisual",
  --     "MCclear",
  --     "MCpattern",
  --     "MCvisualPattern",
  --     "MCunderCursor",
  --   },
  --   keys = {},
  -- },

  -- HTTP REST-Client Interface
  {
    "mistweaverco/kulala.nvim",
    config = function()
      require "configs.kulala"
    end,
  },

  -- {
  --   "rest-nvim/rest.nvim",
  --   config = function()
  --     require("rest-nvim").setup {}
  --   end,
  -- },

  -- Code Runner
  {
    "CRAG666/code_runner.nvim",
    opts = require "configs.coderunner",
  },

  {
    "windwp/nvim-ts-autotag",
  },

  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap-python",
  },
  event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping

  -- nvim-dap
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
  },

  -- markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim",
    },
    opts = {},
  },

  -- flutter/dart
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-vitest",
          require "neotest-python",
          require "neotest-go" {
            args = { "-count=1" },
          },
        },
      }
    end,
  },

  {
    "onsails/lspkind.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.lspkind"
    end,
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require "configs.tiny-inline-diagnostic"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "supermaven-inc/supermaven-nvim",
        opts = {},
      },
    },
    opts = function(_, opts)
      opts.sources[1].trigger_chars = { "-" }
      table.insert(opts.sources, 1, { name = "supermaven" })
    end,
  },

  -- load local plugin example.nvim
  -- {
  --   dir = "D:/PROJECT/Nvim/example.nvim",
  --   opts = {},
  -- },
}
