return {
  'vim-test/vim-test',
  lazy = false,
  config = function()
    vim.g['test#strategy'] = 'neovim'
    vim.g['test#neovim#term_position'] = 'vert'
    vim.keymap.set('n', '<Leader>t', ':TestFile<CR>')
    vim.keymap.set('n', '<Leader>s', ':TestNearest<CR>')
    vim.keymap.set('n', '<Leader>l', ':TestLast<CR>')
    vim.keymap.set('n', '<Leader>a', ':TestSuite<CR>')
    vim.keymap.set('n', '<Leader>gt', ':TestVisit<CR>')
  end
}
