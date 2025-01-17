return  {
  'https://codeberg.org/esensar/nvim-dev-container',
  lazy = false,
  config = function()
    require("devcontainer").setup{}
  end
}
