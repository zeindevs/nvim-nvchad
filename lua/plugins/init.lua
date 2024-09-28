return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
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
        "python",
        "svelte",
        "typescript",
        "javascript",
      },

      -- autotag = {
      --   enable = true,
      -- },

      -- indent = {
      --   enable = true,
      -- }
    },
  },

  -- lsp ts utils
  {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    requires = { "nvim-lua/plenary.nvim" },
    ft = {
      "javascript",
      "typescript",
      "typescriptreact",
    }, -- Optional: Only load for specific filetypes
  },

  -- Test Runner for neovim
  {
    "klen/nvim-test",
    opts = require "configs.nvimtest",
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
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    -- keys = {
    --   { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    -- }
  },

  -- multicursors
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    opts = {},
    cmd = {
      "MCstart",
      "MCvisual",
      "MCclear",
      "MCpattern",
      "MCvisualPattern",
      "MCunderCursor",
    },
    keys = {},
  },

  -- HTTP REST-Client Interface
  {
    "mistweaverco/kulala.nvim",
    config = function()
      require "configs.kulala"
    end,
  },

  {
    "rest-nvim/rest.nvim",
    config = function()
      require("rest-nvim").setup {}
    end
  },

  -- Code Runner
  {
    "CRAG666/code_runner.nvim",
    opts = require "configs.coderunner",
  },

  {
    "windwp/nvim-ts-autotag",
  },

  -- load local plugin example.nvim
  -- {
  --   dir = "D:/PROJECT/Nvim/example.nvim",
  --   opts = {},
  -- },
}
