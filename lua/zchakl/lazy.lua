-- Install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Install your plugins here
require("lazy").setup({

  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "windwp/nvim-autopairs",
  "numToStr/Comment.nvim",
  "kyazdani42/nvim-web-devicons",
  "kyazdani42/nvim-tree.lua",
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",
  "nvim-lualine/lualine.nvim",
  "akinsho/toggleterm.nvim",
  "ahmedkhalf/project.nvim",
  "lewis6991/impatient.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "goolord/alpha-nvim",
  "antoinemadec/FixCursorHold.nvim",
  "folke/which-key.nvim",
  "unblevable/quick-scope",
  "phaazon/hop.nvim",
  "andymass/vim-matchup",
  "nacro90/numb.nvim",
  "monaqa/dial.nvim",
  "norcalli/nvim-colorizer.lua",
  "windwp/nvim-spectre",
  "windwp/nvim-ts-autotag",
  "folke/zen-mode.nvim",
  "karb94/neoscroll.nvim",
  "folke/todo-comments.nvim",
  "kevinhwang91/nvim-bqf",
  "ThePrimeagen/harpoon",
  "MattesGroeger/vim-bookmarks",
  "lunarvim/vim-solidity",
  "Mephistophiles/surround.nvim",
  "tpope/vim-repeat",
  "Shatur/neovim-session-manager",
  "rcarriga/nvim-notify",
  "tversteeg/registers.nvim",
  "preservim/tagbar",
  "nyngwang/NeoZoom.lua",
  "SmiteshP/nvim-gps",
  "sidebar-nvim/sidebar.nvim",

  -- Setup of LSP, DAP, etc

  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    dependencies = {
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
  },

  "lukas-reineke/lsp-format.nvim",
  "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
  "nvim-lua/lsp_extensions.nvim",



  { "michaelb/sniprun",              build = "bash ./install.sh" },
  {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "filipdutescu/renamer.nvim",
    branch = "master",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  {
    "ruifm/gitlinker.nvim",
    requires = "nvim-lua/plenary.nvim",
  },

  -- Colorschemes
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use


  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
  },

  -- Telescope
  { "nvim-telescope/telescope.nvim", cmd = "Telescope" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "nvim-treesitter/nvim-treesitter-context",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "nvim-treesitter/playground",
  -- Git
  "lewis6991/gitsigns.nvim",

  -- DAP
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "jbyuki/one-small-step-for-vimkind",
  "dstein64/vim-startuptime",
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
})
