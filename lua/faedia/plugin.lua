require('lazy').setup({
	-- themes
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1000,
	},

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

	-- telescope fuzzy finding
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function ()
					return vim.fn.executable 'make' == 1
				end,
			},
		},
	},
}, {})
