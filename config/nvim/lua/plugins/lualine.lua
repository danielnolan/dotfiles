return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup()
  end,
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  }
}
