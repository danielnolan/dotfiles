return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local telescopeConfig = require("telescope.config")
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    table.insert(vimgrep_arguments, "--hidden")
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    telescope.setup {
      defaults = {
        vimgrep_arguments = vimgrep_arguments,
      },
      pickers = {
        buffers = {
          sort_mru = true
        },

        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      },
    }

    telescope.load_extension('fzf')

    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end
}
