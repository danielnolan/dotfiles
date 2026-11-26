-- Follow the Omarchy theme when running on Omarchy, gruvbox everywhere else.
--
-- Omarchy writes the current theme as a LazyVim-style spec list:
--   { { "author/theme.nvim", ... }, { "LazyVim/LazyVim", opts = { colorscheme = "name" } } }
-- We keep the theme plugin specs and read the colorscheme name from the
-- LazyVim entry, without depending on LazyVim itself.
local M = {}

local default = { specs = {}, colorscheme = 'gruvbox' }
local omarchy_theme = vim.fn.expand('~/.local/state/omarchy/current/theme/neovim.lua')

function M.get()
  if M._cache then
    return M._cache
  end
  M._cache = default

  if vim.fn.filereadable(omarchy_theme) == 0 then
    return M._cache
  end

  local ok, specs = pcall(dofile, omarchy_theme)
  if not ok or type(specs) ~= 'table' then
    return M._cache
  end

  local result = { specs = {}, colorscheme = nil }
  for _, spec in ipairs(specs) do
    if type(spec) == 'table' then
      if spec[1] == 'LazyVim/LazyVim' then
        result.colorscheme = spec.opts and spec.opts.colorscheme
      else
        table.insert(result.specs, spec)
      end
    end
  end

  if result.colorscheme then
    M._cache = result
  end
  return M._cache
end

function M.apply()
  local name = M.get().colorscheme
  if not pcall(vim.cmd.colorscheme, name) then
    pcall(vim.cmd.colorscheme, default.colorscheme)
  end
end

return M
