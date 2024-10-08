local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use "ellisonleao/gruvbox.nvim"
  use {"nvim-tree/nvim-tree.lua",requires = {"nvim-tree/nvim-web-devicons"}}
  use "nvim-tree/nvim-web-devicons"
  use {"nvim-lualine/lualine.nvim",requires = {"nvim-tree/nvim-web-devicons"}}
  use {"nvim-treesitter/nvim-treesitter",
      run = function()
        local ts_update = require("nvim-treesitter.install").update {with_sync = true }
        ts_update()
      end,
      }
  use {"nvim-telescope/telescope.nvim" ,tag = "0.1.1", requires = {{"nvim-lua/plenary.nvim"}}}
  use "christoomey/vim-tmux-navigator"
  use "neovim/nvim-lspconfig"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use {"williamboman/mason.nvim","williamboman/mason-lspconfig.nvim",run = ":MasonUpdate"}
  use "stevearc/oil.nvim"
  use "windwp/nvim-autopairs"
  use "rafamadriz/friendly-snippets"
  use {"glepnir/dashboard-nvim",requires = {"nvim-tree/nvim-web-devicons"}}
  use "voldikss/vim-floaterm"
  use "hrsh7th/cmp-cmdline"
  use "tpope/vim-unimpaired"

  --
  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
