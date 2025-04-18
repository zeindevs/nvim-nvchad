-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.nvdash = {
  load_on_startup = true,
}

M.base46 = {
  theme = "chadracula-evondev",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.term = {
  winopts = { number = false, relativenumber = false },
  sizes = { sp = 0.3, vsp = 0.4, ["bo sp"] = 0.3, ["bo vsp"] = 0.4 },
  float = {
    relative = "editor",
    row = 0.15,
    col = 0.1,
    width = 0.8,
    height = 0.5,
    border = "single",
  },
}

return M
