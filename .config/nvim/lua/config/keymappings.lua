-- Key mappings

-- easily flip back to previous file
vim.keymap.set('n', '<Leader><Leader>', '<C-^>')

-- open netrw
vim.keymap.set('n', '-', ':Explore<CR>')

-- easier window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- close bufffer, but not window
vim.keymap.set('n', '<Leader>c', ':ene<CR>:bw #<CR>')

-- clear white space
vim.keymap.set('n', '<Leader>ws', [[:%s/\s\+$//e<CR>]])

-- format buffer with lsp if configured
vim.keymap.set('n', '<Leader>fb', vim.lsp.buf.format)

-- open and navigate the diagnostic float
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist)
