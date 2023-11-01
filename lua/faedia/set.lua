-- Basic sets for vim config
vim.opt.guicursor = ''

-- set highlight search
vim.o.hlsearch = false

-- set line number
vim.wo.number = true
vim.wo.relativenumber = true

--set default tab and indent options
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- enable mouse
vim.o.mouse = 'a'

-- TODO: enable clipboard


-- enable break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- TODO: decide on search case insensitivity

-- keep sign column on
vim.wo.signcolumn = 'yes'

-- enable terminal colours
vim.o.termguicolors = true

-- set colorscheme
vim.cmd.colorscheme 'catppuccin'

-- reduce update time for performance
vim.o.updatetime = 250
vim.o.timeoutlen = 300
