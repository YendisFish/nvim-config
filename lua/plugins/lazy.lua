-- Bootstrap lazy.nvim -- 
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

-- Plugin Loads --
require('lazy').setup({
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = "false",
    build = "TSUpdate",
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
      "hrsh7th/nvim-cmp",

      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
      },
      config = function()
          require('plugins.cmp')
      end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require('plugins.whichkey')
    end
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("plugins.oil")
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl"
  }
})

require('plugins.treesitter')
require('plugins.onedark')
require('plugins.lspconfig')


require("ibl").setup()
