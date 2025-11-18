-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.nvdash = {
  load_on_startup = true,
}

-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

M.base46 = {
  theme = "onedark",
  integrations = { "dap" },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.term = {
  float = {
    row = 0.2,
    col = 0.1,
    width = 0.8,
  },
}

return M
