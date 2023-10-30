require('lazy').setup({
	-- themes
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1000,
	},

	-- add git support
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',

	-- detect tabstop and shiftwidth
	'tpope/vim-sleuth',

	-- setup LSP plugins
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- sets up lsp for nvim config
			'folke/neodev.nvim',
			{
				'j-hui/fidget.nvim',
				tag = 'legacy',
				opts = {},
			},
		}
	},

	-- autocompletion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- snippet engine
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'rafamadriz/friendly-snippets'
		},
	},

	-- displays pending bindings
	{
		'folke/which-key.nvim',
		opts = {},
	},

	-- adds git signs into gutter
	{
		'lewis6991/gitsigns.nvim',
		opts = {},
	},

	-- add lualine
	{
		'nvim-lualine/lualine.nvim',
		opts = {}
	},

	-- add indentation guides
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {},
	},

	-- add comment utilities
	{
		'numToStr/Comment.nvim',
		opts = {},
	},

	-- telescope fuzzy finding
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build =
				'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
			},
		},
	},

	-- add treesitter. Better highlight, edit and code navigation
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
	},
}, {})
