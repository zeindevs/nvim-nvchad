return {
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

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

  -- test new blink
  {
    enabled = false,
    import = "nvchad.blink.lazyspec",
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
      highlight = {
        enable = true,
      },
      -- autotag = {
      --   enable = true,
      -- },
      indent = {
        enable = true,
      },
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
  },

  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },

  -- HTTP REST-Client Interface
  {
    enable = false,
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    opts = {
      global_keymaps = true,
      global_keymaps_prefix = "<leader>R",
      kulala_keymaps_prefix = "",
    },
  },

  -- Code Runner
  {
    "CRAG666/code_runner.nvim",
    event = "VeryLazy",
    config = function()
      require("code_runner").setup {
        mode = "float",
        float = {
          border = "single",
        },
        filetype = {
          typescript = "tsx",
          php = "php",
          go = "go run",
          lua = "lua",
          zig = "zig run",
        },
      }
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup {}
    end,
  },

  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
    config = function()
      require("venv-selector").setup {}
    end,
  },

  -- nvim-dap
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require "configs.dap"
    end,
  },

  -- markdown
  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "echasnovski/mini.nvim",
  --   },
  --   opts = {},
  --   config = function()
  --     require("render-markdown").setup {}
  --   end,
  -- },

  -- flutter/dart
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup {}
    end,
  },

  {
    -- enabled = false,
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
      "fredrikaverpil/neotest-golang",
      "arthur944/neotest-bun",
      "olimorris/neotest-phpunit",
      "orjangj/neotest-ctest",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-vitest",
          require "neotest-python",
          require "neotest-golang" {
            args = { "-count=1" },
          },
          require "neotest-bun",
          require "neotest-phpunit",
          require "neotest-ctest",
        },
      }
    end,
  },

  -- {
  --   "onsails/lspkind.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require "configs.lspkind"
  --   end,
  -- },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup {}
    end,
  },

  {
    enabled = false,
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    config = function()
      require("supermaven-nvim").setup {}
    end,
  },

  -- {
  --   "github/copilot.vim",
  --   -- event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup {}
  --   end,
  -- },

  {
    "oribarilan/lensline.nvim",
    tag = "1.0.0",
    event = "LspAttach",
    config = function()
      require("lensline").setup()
    end,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      -- { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    "folke/noice.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {
      max_width = 120,
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
      }
    end,
  },

  {
    "hedyhli/outline.nvim",
    event = "VeryLazy",
    config = function()
      require("outline").setup {}
    end,
  },

  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
  },

  {
    "MagicDuck/grug-far.nvim",
    event = "VeryLazy",
    config = function()
      require("grug-far").setup {}
    end,
  },

  -- {
  --   "nickjvandyke/opencode.nvim",
  --   event = "VeryLazy",
  --   version = "*", -- Latest stable release
  --   dependencies = {
  --     {
  --       -- `snacks.nvim` integration is recommended, but optional
  --       ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
  --       "folke/snacks.nvim",
  --       optional = true,
  --       opts = {
  --         input = {}, -- Enhances `ask()`
  --         picker = { -- Enhances `select()`
  --           actions = {
  --             opencode_send = function(...)
  --               return require("opencode").snacks_picker_send(...)
  --             end,
  --           },
  --           win = {
  --             input = {
  --               keys = {
  --                 ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
  --               },
  --             },
  --           },
  --         },
  --       },
  --     },
  --   },
  --   config = function()
  --     vim.g.opencode_opts = {}
  --     vim.o.autoread = true -- Required for `opts.events.reload`
  --
  --     -- Recommended/example keymaps
  --     vim.keymap.set({ "n", "x" }, "<C-a>", function()
  --       require("opencode").ask("@this: ", { submit = true })
  --     end, { desc = "Ask opencode…" })
  --     vim.keymap.set({ "n", "x" }, "<C-x>", function()
  --       require("opencode").select()
  --     end, { desc = "Execute opencode action…" })
  --     vim.keymap.set({ "n", "t" }, "<C-.>", function()
  --       require("opencode").toggle()
  --     end, { desc = "Toggle opencode" })
  --
  --     vim.keymap.set({ "n", "x" }, "go", function()
  --       return require("opencode").operator "@this "
  --     end, { desc = "Add range to opencode", expr = true })
  --     vim.keymap.set("n", "goo", function()
  --       return require("opencode").operator "@this " .. "_"
  --     end, { desc = "Add line to opencode", expr = true })
  --
  --     vim.keymap.set("n", "<S-C-u>", function()
  --       require("opencode").command "session.half.page.up"
  --     end, { desc = "Scroll opencode up" })
  --     vim.keymap.set("n", "<S-C-d>", function()
  --       require("opencode").command "session.half.page.down"
  --     end, { desc = "Scroll opencode down" })
  --
  --     -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above
  --     -- otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
  --     vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
  --     vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
  --   end,
  -- },

  {
    "dmtrKovalenko/fff.nvim",
    build = function()
      -- this will download prebuild binary or try to use existing rustup toolchain to build from source
      -- (if you are using lazy you can use gb for rebuilding a plugin if needed)
      require("fff.download").download_or_build_binary()
    end,
    -- if you are using nixos
    -- build = "nix run .#release",
    opts = { -- (optional)
      debug = {
        enabled = false,
        show_scores = false,
      },
    },
    -- No need to lazy-load with lazy.nvim.
    -- This plugin initializes itself lazily.
    lazy = false,
    keys = {
      {
        "fn", -- try it if you didn't it is a banger keybinding for a picker
        function()
          require("fff").find_files()
        end,
        desc = "FFFind files",
      },
      {
        "fg",
        function()
          require("fff").live_grep()
        end,
        desc = "LiFFFe grep",
      },
      {
        "fz",
        function()
          require("fff").live_grep {
            grep = {
              modes = { "fuzzy", "plain" },
            },
          }
        end,
        desc = "Live fffuzy grep",
      },
      {
        "fc",
        function()
          require("fff").live_grep { query = vim.fn.expand "<cword>" }
        end,
        desc = "Search current word",
      },
    },
  },

  -- load local plugin example.nvim
  -- {
  --   dir = "~/.config/example.nvim",
  --   opts = {},
  -- },
}
