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
        {  "nvim-treesitter/nvim-treesitter"  },
        {  "EdenEast/nightfox.nvim" },
        {  "nvim-tree/nvim-web-devicons"  },
        {  "nvim-telescope/telescope.nvim"  },
        {  "nvim-telescope/telescope-fzf-native.nvim", build = 'make'  },
        {  "nvim-telescope/telescope-ui-select.nvim"  },
        {  "nvim-telescope/telescope-file-browser.nvim"  },
        {  "hrsh7th/nvim-cmp"  },
        {  "hrsh7th/cmp-buffer"  },
        {  "hrsh7th/cmp-nvim-lsp"  },
        {  "onsails/lspkind-nvim"  },
        {  "mhartington/formatter.nvim" },
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
