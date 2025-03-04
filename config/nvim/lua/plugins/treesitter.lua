  return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    dependencies = {
      'RRethy/nvim-treesitter-endwise',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function ()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = {
          "ruby",
          "lua",
          "javascript",
          "python",
          "go",
          "html",
          "jsonc",
          "json"
        },
        highlight = { enable = true },
        indent = { enable = false },
        endwise = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["am"] = "@function.outer",
              ["im"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["ir"] = "@block.inner",
              ["ar"] = "@block.outer",
            },
            include_surrounding_whitespace = false,
          },
        },
      })
    end
  }
