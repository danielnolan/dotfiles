return  {
  'L3MON4D3/LuaSnip',
  version = '2.*',
  lazy = false,
  dependencies = {
    'rafamadriz/friendly-snippets'
  },
  config = function()
    require'luasnip'.filetype_extend('ruby', {'rails'})
    require'luasnip'.filetype_extend('eruby', {'html'})
    require('luasnip.loaders.from_vscode').lazy_load()
    local ls = require('luasnip')
    vim.keymap.set("i", "<C-K>", function() ls.expand() end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

    vim.keymap.set({"i", "s"}, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, {silent = true})
  end
}
