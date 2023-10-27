return {
  'klen/nvim-test',
  lazy = false,
  config = function()
    require('nvim-test').setup()
    require('nvim-test.runners.rspec'):setup {
      command = "bundle"
    }
    vim.keymap.set('n', '<Leader>t', ':TestFile<CR>')
    vim.keymap.set('n', '<Leader>s', ':TestNearest<CR>')
    vim.keymap.set('n', '<Leader>l', ':TestLast<CR>')
    vim.keymap.set('n', '<Leader>a', ':TestSuite<CR>')
    vim.keymap.set('n', '<Leader>gt', ':TestVisit<CR>')
  end
}
