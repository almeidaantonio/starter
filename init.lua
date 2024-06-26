vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
local autocmd = vim.api.nvim_create_autocmd

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

autocmd("bufenter", {
  pattern = "*",
  command = "if (winnr(\"$\") == 1 && &filetype == \"nvimtree\") | q | endif",
})

vim.wo.relativenumber = true

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = {
    "*.py",
    "*.cs",
    "*.md",
  },
  command = "setlocal tabstop=4 shiftwidth=4 expandtab"
})

-- Copilot setup.
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
