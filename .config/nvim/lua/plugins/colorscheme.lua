-- The colorscheme itself is applied in init.lua via config.theme.apply(),
-- which lets lazy.nvim load whichever theme plugin provides it.
local specs = {
  { 'ellisonleao/gruvbox.nvim', priority = 1000 },
}

for _, spec in ipairs(require('config.theme').get().specs) do
  table.insert(specs, spec)
end

return specs
