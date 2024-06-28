print("hello, world!")
vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({'morhetz/gruvbox'})
	use({'olivercederborg/poimandres.nvim'})
	use({'hsi/lapland.nvim'})
	use({'atelierbram/base4tone-nvim'})
	use({'blazkowolf/gruber-darker.nvim'})
	use({'folke/tokyonight.nvim'})
	use({'rebelot/kanagawa.nvim'})
	use({'mofiqul/vscode.nvim'})
	use({'kdheepak/monochrome.nvim'})
	use({'rafi/awesome-vim-colorschemes'})
	use({'mcchrish/vim-no-color-collections'})

	use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
	use('nvim-treesitter/playground')

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

	use ({'shortcuts/no-neck-pain.nvim', tag = '*'})

end)
