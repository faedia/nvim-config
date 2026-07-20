local installed = require('nvim-treesitter').get_installed('parsers')

vim.api.nvim_create_autocmd('FileType', {
	pattern = installed,
	callback = function() vim.treesitter.start() end,
})
