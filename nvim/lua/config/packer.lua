vim.cmd([[packadd packer.nvim]])

return require("packer").startup({
	function(use)
		use({ "wbthomason/packer.nvim" })
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.x",
			requires = { { "nvim-lua/plenary.nvim" } },
		})
        use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
        use({ "nvim-telescope/telescope-ui-select.nvim" })
		use({ "nyoom-engineering/oxocarbon.nvim" })
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
		})
        use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			tag = "nightly",
		})
        use({  "rmagatti/auto-session" })
		use({  "rktjmp/shenzhen-solitaire.nvim" })
        use({  "folke/which-key.nvim" })
        use({  "romgrk/barbar.nvim", requires = "nvim-tree/nvim-web-devicons" })
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
