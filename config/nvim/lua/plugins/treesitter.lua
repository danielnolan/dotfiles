  return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'RRethy/nvim-treesitter-endwise',
      config = function()
        require('nvim-treesitter.configs').setup {
          endwise = {
              enable = true,
          },
        }
      end
    },
    config = function ()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        highlight = { enable = true },
        indent = { enable = true },
        endwise = { enable = true }
      })
    end
  }
