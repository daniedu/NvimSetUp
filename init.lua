-- init.lua

-- --- 1. Lazy.nvim Bootstrap Code ---
-- This block ensures lazy.nvim is installed and available.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- --- 2. Essential Global Variables (MUST BE HERE) ---
-- Set mapleader and maplocalleader BEFORE lazy.nvim setup
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- --- 3. Lazy.nvim Plugin Configuration ---
-- All of your plugins are declared inside this setup function.
require("lazy").setup({
  -- Example: Add Lualine for a status line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('plugins.lualine')
    end,
  },
  
  -- Example: Add nvim-treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('plugins.treesitter')
    end,
  },
  
  -- Add all other plugins here.
})

-- --- 4. Custom Core Configuration (Loaded after plugins) ---
-- These files contain your general Neovim options and keymaps.
require('core.options')
require('core.keymaps')