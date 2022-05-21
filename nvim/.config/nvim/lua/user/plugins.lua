local fn = vim.fn

-- Automatically install packer -- bootstrap from github
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
   vim.cmd([[packadd packer.nvim]]) -- Gör denna något?? Laddar packer men borde väl ändå starta om nvim?
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file --very nice
vim.cmd([=[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]=])
--autocmd BufWritePost plugins.lua source <afile> | PackerCompile -- from github? PackerSync vs PackerCompile?

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
   print("Packer not found")
   return
end

-- Have packer use a popup window -- customize??
--[[packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
]]
--

-- Install your plugins here
return packer.startup({
   function(use)
      use("wbthomason/packer.nvim") -- Have packer manage itself
      use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
      use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

      use({
         "lewis6991/impatient.nvim",
         requires = {},
         config = function()
            require("user.setup.impatient")
         end,
      })

      use({
         "neovim/nvim-lspconfig", -- enable LSP
         config = function()
            require("user.lsp")
         end,
         requires = { --use "williamboman/nvim-lsp-installer", -- simple to use language server installer
            --use "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
            "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
         },
      })

      -- cmp plugins
      use({
         "hrsh7th/nvim-cmp",
         config = function()
            require("user.setup.cmp")
         end,
         requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icon
            "hrsh7th/cmp-buffer", -- buffer completions
            "hrsh7th/cmp-nvim-lua", -- Nvim-lua specific completions
            "hrsh7th/cmp-path", -- path completions
            "hrsh7th/cmp-cmdline", -- cmdline completions
            "saadparwaiz1/cmp_luasnip", -- snippet completions
            "hrsh7th/cmp-nvim-lsp",
         },
      })

      -- Treesitter
      use({
         "nvim-treesitter/nvim-treesitter",
         run = ":TSUpdate",
         config = function()
            require("user.setup.treesitter")
         end,
         requires = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            "p00f/nvim-ts-rainbow",
            "windwp/nvim-ts-autotag", -- Autoptags. Could have some wierd lsp issue. Check github if so.
         },
      })

      -- Telescope
      use({
         "nvim-telescope/telescope.nvim",
         config = function()
            require("user.setup.telescope")
         end,
         requires = {
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
         },
      })

      use({
         "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
         config = function()
            require("user.setup.autopairs")
         end,
         requires = {},
      })

      use({
         "numToStr/Comment.nvim", -- Easily comment stuff
         config = function()
            require("user.setup.comment")
         end,
         requires = {},
      })

      -- snippets
      use({
      "L3MON4D3/LuaSnip", --snippet engine
         config = function()
            require("user.setup.lua-snip")
         end,
         requires = {},
      })
      use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

      use({
         "kyazdani42/nvim-tree.lua",
         requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icon
         },
         config = function()
            require("user.setup.nvim_tree")
         end,
      })

      use({
         "nvim-lualine/lualine.nvim",
         requires = { "kyazdani42/nvim-web-devicons" },
         config = function()
            require("user.setup.lualine")
         end,
      })

      use({
         "lukas-reineke/indent-blankline.nvim",
         requires = {},
         config = function()
            require("user.setup.indentline")
         end,
      })

      use({
         "goolord/alpha-nvim",
         requires = {},
         config = function()
            require("user.setup.alpha")
         end,
      })

      -- Which key
      use({
         "folke/which-key.nvim",
         requires = {},
         config = function()
            require("user.setup.whichkey")
         end,
      })

      -- Git
      use({
         "lewis6991/gitsigns.nvim",
         requires = {},
         config = function()
            require("user.setup.gitsigns")
         end,
      })

      -- color
      use({
         "norcalli/nvim-colorizer.lua",
         requires = {},
         config = function()
            require("user.setup.colorizer")
         end,
      })

      -- Colorschemes
      use("lunarvim/colorschemes") -- A bunch of colorschemes you can try out
      use("lunarvim/darkplus.nvim")
      use({ "ellisonleao/gruvbox.nvim" }) -- gruvbox of course
      use("tjdevries/colorbuddy.vim")
      use("tjdevries/gruvbuddy.nvim")

      -- Other plugins
      use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
      use({
         "vimwiki/vimwiki",
         requires = {},
         config = function()
            require("user.setup.vimwiki")
         end,
      })

      use({
         "mbbill/undotree", -- undotree
         requires = {},
         config = function()
            require("user.setup.undotree")
         end,
      })

      use("tpope/vim-surround")
      use("tpope/vim-sleuth")
      use("tyru/open-browser.vim")
      use("ThePrimeagen/vim-be-good")

      use("tpope/vim-repeat")

      use("troydm/zoomwintab.vim")
      use("linluk/vim-c2h")
      use("lambdalisue/suda.vim")
      use({
         "catppuccin/nvim",
         as = "catppuccin",
         config = function()
            require("user.setup.catpuccin")
         end,
      })
      use({
         "ahmedkhalf/project.nvim",
         config = function()
            require("user.setup.project")
         end,
      })
      -- Checkif breaks anything
      use({
         "folke/lsp-colors.nvim",
         config = function()
            require("lsp-colors").setup({
               Error = "#db4b4b",
               Warning = "#e0af68",
               Information = "#0db9d7",
               Hint = "#10B981",
            })
         end,
      })
      use({
         "ethanholz/nvim-lastplace",
         config = function()
            require("nvim-lastplace").setup({
               lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
               lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
               lastplace_open_folds = true,
            })
         end,
      })

      use({
         "folke/todo-comments.nvim",
         requires = {},
         config = function()
            require("user.setup.todo_comments")
         end,
      })
      -- calls autocmd:s to much
      -- use({
      -- "Pocco81/AutoSave.nvim",
      --    requires = {},
      --    config = function()
      --       require("user.setup.autosave")
      --    end,
      -- })
      --plugins to try someday
      --use "akinsho/toggleterm.nvim"
      ----Plug 'glepnir/lspsaga.nvim'
      --Plug 'simrat39/symbols-outline.nvim'

      -- plugins i probaly dont care about
      -- use("mohitmun/spu.vim")
      --use "akinsho/bufferline.nvim"
      --use "moll/vim-bbye"
      -- Automatically set up your configuration after cloning packer.nvim
      -- Put this at the end after all plugins
      if PACKER_BOOTSTRAP then
         require("packer").sync()
      end
   end,
   config = {
      display = {
         open_fn = function()
            --return require('packer.util').float({ border = 'single' })
            return require("packer.util").float({ border = "rounded" })
         end,
      },
   },
})
