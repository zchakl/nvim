local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
  profile = {
    enable = true,
    threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("windwp/nvim-autopairs")
  use("numToStr/Comment.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use("akinsho/bufferline.nvim")
  use("moll/vim-bbye")
  use("nvim-lualine/lualine.nvim")
  use("akinsho/toggleterm.nvim")
  use("ahmedkhalf/project.nvim")
  use("lewis6991/impatient.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("goolord/alpha-nvim")
  use("antoinemadec/FixCursorHold.nvim")
  use("folke/which-key.nvim")
  use("unblevable/quick-scope")
  use("phaazon/hop.nvim")
  use("andymass/vim-matchup")
  use("nacro90/numb.nvim")
  use("monaqa/dial.nvim")
  use("norcalli/nvim-colorizer.lua")
  use("windwp/nvim-spectre")
  use("windwp/nvim-ts-autotag")
  use("folke/zen-mode.nvim")
  use("karb94/neoscroll.nvim")
  use("folke/todo-comments.nvim")
  use("kevinhwang91/nvim-bqf")
  use("ThePrimeagen/harpoon")
  use("MattesGroeger/vim-bookmarks")
  use("lunarvim/vim-solidity")
  use("Mephistophiles/surround.nvim")
  use("tpope/vim-repeat")
  use("Shatur/neovim-session-manager")
  use("rcarriga/nvim-notify")
  use("tversteeg/registers.nvim")
  use("preservim/tagbar")
  use("nyngwang/NeoZoom.lua")
  use("SmiteshP/nvim-gps")
  use("sidebar-nvim/sidebar.nvim")

  -- Setup of LSP, DAP, etc

  -- LSP
  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      { "williamboman/mason.nvim" }, -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "hrsh7th/cmp-buffer" }, -- Optional
      { "hrsh7th/cmp-path" }, -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" }, -- Optional
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-emoji" },

      -- Snippets
      { "L3MON4D3/LuaSnip" }, -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
    },
  })

  use("lukas-reineke/lsp-format.nvim")
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  use("nvim-lua/lsp_extensions.nvim")


  use({ "michaelb/sniprun", run = "bash ./install.sh" })
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })

  use({
    "filipdutescu/renamer.nvim",
    branch = "master",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({
    "ruifm/gitlinker.nvim",
    requires = "nvim-lua/plenary.nvim",
  })

  -- Colorschemes
  use("folke/tokyonight.nvim")

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use


  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })
  use("jlcrochet/vim-razor")

  -- Telescope
  use({ "nvim-telescope/telescope.nvim", cmd = "Telescope" })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("nvim-treesitter/nvim-treesitter-context")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("nvim-treesitter/playground")
  -- Git
  use("lewis6991/gitsigns.nvim")

  -- DAP
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("jbyuki/one-small-step-for-vimkind")
  use("dstein64/vim-startuptime")
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
