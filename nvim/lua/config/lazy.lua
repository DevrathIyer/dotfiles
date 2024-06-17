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

require("lazy").setup( {
        {  "folke/lazy.nvim"  },
        {  "nvim-lua/plenary.nvim"  },
        {  "EdenEast/nightfox.nvim" },
		{  "nvim-treesitter/nvim-treesitter"  },
		{  "akinsho/toggleterm.nvim"  },
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            }
        },
        {  "nvim-treesitter/nvim-treesitter"  },
        {  "nvim-telescope/telescope.nvim"  },
        {  "nvim-telescope/telescope-fzf-native.nvim", build = 'make'  },
        {  "nvim-telescope/telescope-ui-select.nvim"  },
        {  "rmagatti/auto-session"   },
		{  "rktjmp/shenzhen-solitaire.nvim"  },
        {  "folke/which-key.nvim"  },
        {  "romgrk/barbar.nvim"  },
        {  "mhartington/formatter.nvim" },
        {  "SmiteshP/nvim-navic" },
        {  "hrsh7th/nvim-cmp"  },
        {  "hrsh7th/cmp-buffer"  },
        {  "hrsh7th/cmp-nvim-lsp"  },
        {  "L3MON4D3/LuaSnip"  },
        {  "lervag/vimtex"  },
        {  "onsails/lspkind-nvim"  },
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v2.x',
            dependencies = {
              -- LSP Support
              {'neovim/nvim-lspconfig'},             -- Required
              {'williamboman/mason.nvim'},           -- Optional
              {'williamboman/mason-lspconfig.nvim'}, -- Optional
          }
        }
    }
)
