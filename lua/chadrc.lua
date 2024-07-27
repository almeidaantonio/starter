---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "chadracula",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    Type = { italic = true },

  },
}

return M
