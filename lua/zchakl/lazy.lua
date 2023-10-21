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
    -- Core Plugins
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "windwp/nvim-autopairs",
    "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
    "akinsho/toggleterm.nvim",
    "ahmedkhalf/project.nvim",
    "folke/which-key.nvim",
    {
        "ThePrimeagen/harpoon",
        dependencies = 'nvim-lua/plenary.nvim',
    },
    --"preservim/tagbar",
    "sidebar-nvim/sidebar.nvim",
    {
        "goolord/alpha-nvim",
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
    },
    "rcarriga/nvim-notify",
    "MunifTanjim/nui.nvim",

    {
        "folke/noice.nvim",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },

    -- Not Core but not useless Plugins
    "numToStr/Comment.nvim",
    "ojroques/nvim-bufdel",
    "lewis6991/impatient.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "phaazon/hop.nvim", --TODO set up hop
    "nacro90/numb.nvim",
    "monaqa/dial.nvim",
    "norcalli/nvim-colorizer.lua",
    {
        "windwp/nvim-spectre",
        dependencies = "nvim-lua/plenary.nvim",
    },
    "folke/zen-mode.nvim",
    "karb94/neoscroll.nvim",
    "kevinhwang91/nvim-bqf",
    "Mephistophiles/surround.nvim",
    {
        "Shatur/neovim-session-manager",
        dependencies = "nvim-lua/plenary.nvim",
    },


    -- Setup of LSP, DAP, etc

    -- LSP
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },       -- Required
            { "williamboman/mason.nvim" },     -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },   -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "hrsh7th/cmp-buffer" }, -- Optional
            { "hrsh7th/cmp-path" },   -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" }, -- Optional
            { "hrsh7th/cmp-cmdline" },
            { "hrsh7th/cmp-emoji" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },       -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        },
    },

    "lukas-reineke/lsp-format.nvim",
    "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
    "nvim-lua/lsp_extensions.nvim",
    "jlcrochet/vim-razor",
    {
        "lewis6991/hover.nvim",
        config = function()
            require("hover").setup {
                init = function()
                    -- Require providers
                    require("hover.providers.lsp")
                    -- require('hover.providers.gh')
                    -- require('hover.providers.gh_user')
                    -- require('hover.providers.jira')
                    -- require('hover.providers.man')
                    -- require('hover.providers.dictionary')
                end,
                preview_opts = {
                    border = nil
                },
                -- Whether the contents of a currently open hover window should be moved
                -- to a :h preview-window when pressing the hover keymap.
                preview_window = false,
                title = true
            }

            -- Setup keymaps
            vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
            vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
        end
    },

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
    "L3MON4D3/LuaSnip",           --snippet engine
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use


    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
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
    "windwp/nvim-ts-autotag",

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
