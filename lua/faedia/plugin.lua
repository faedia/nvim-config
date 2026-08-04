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
		opts = {},
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			opts = {},
		},
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

	-- snacks
	{
		"folke/snacks.nvim",
		lazy = false,
	},

	-- add treesitter. Better highlight, edit and code navigation
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
	},

	{
		'nvim-treesitter/nvim-treesitter-textobjects',
		branch = "main"
	},

	-- add markdown preview support
	{
		'iamcco/markdown-preview.nvim',
		cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_auto_close = 0
		end,
		ft = { 'markdown' },
	},

	-- add a better file tree.
	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			view_options = {
				show_hidden = true
			}
		},

		dependencies = {
			{
				"echasnovski/mini.icons",
				opts = {},
			},
		},
		lazy = false,
	},

	-- copilot support.
	{
		'github/copilot.vim',
	},

	-- Doxygen support.
	{
		'danymat/neogen',
		config = function()
			require('neogen').setup({
				snippet_engine = 'luasnip',
				languages = {
					c = {
						template = {
							annotation_convention = 'doxygen',
						},
					},
					cpp = {
						template = {
							annotation_convention = 'doxygen',
						},
					},
				},
			})
		end,
	},
}, {})
