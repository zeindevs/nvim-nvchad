local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
    -- opts = {
    --   servers = {
    --     jsonls = {
    --       on_new_config = function(new_config) 
    --         new_config.settings.json.schemas = new_config.settings.json.schemas or {}
    --         vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
    --       end,
    --       settings = {
    --         json = {
    --           format = { enable = true },
    --           validate = { enable = true}
    --         }
    --       }
    --     }
    --   }
    -- }
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }

  {
    'jose-elias-alvarez/nvim-lsp-ts-utils',
    requires = { 'nvim-lua/plenary.nvim' },
    ft = { 'typescript', 'typescriptreact' }, -- Optional: Only load for specific filetypes
  }
}

return plugins
