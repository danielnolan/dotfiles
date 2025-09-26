vim.opt.encoding = 'utf-8'

vim.opt.autoindent = true
vim.opt.autowrite = true
vim.opt.background = 'dark'
vim.opt.backspace = '2'
vim.opt.backup = false
vim.opt.colorcolumn = '80'
vim.opt.complete:append('kspell')
vim.opt.completeopt = 'menu'
vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.history = 50
vim.opt.hidden = true
vim.opt.inccommand = 'split'
vim.opt.incsearch = true
vim.opt.joinspaces = false
vim.opt.laststatus = 2
vim.opt.list = true 
vim.opt.listchars = { tab = '»·', trail = '·', nbsp = '·' }
vim.opt.modelines = 0
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.signcolumn = 'yes'
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.swapfile = false
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.opt.termguicolors = true
vim.opt.wildmode = "longest,list:longest,full"
vim.opt.writebackup = false
vim.opt.undofile = true

-- Softtabs, 2 spaces
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Treat <li> and <p> tags like blocks
vim.g.html_indent_inctags = 'html,body,head,tbody,p,li'

-- Sane splits
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.diagnostic.config({ virtual_text = false })
