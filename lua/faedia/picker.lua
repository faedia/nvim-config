local Snacks = require('snacks.picker')

-- set basic keymaps
vim.keymap.set('n', '<leader>?', Snacks.recent, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', Snacks.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', Snacks.grep_buffers, { desc = '[/] Fuzzy search in buffers' })

vim.keymap.set('n', '<leader>gf', Snacks.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', Snacks.files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', Snacks.help, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', Snacks.grep_word, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', Snacks.grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', Snacks.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', Snacks.resume, { desc = '[S]earch [R]esume' })

