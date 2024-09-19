local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = true

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
-- opt.colorcolumn = "100"
-- opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menu,noinsert,noselect"

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.directory = vim.fn.expand("~/.vim/backup//")
opt.swapfile = true
opt.backupdir = vim.fn.expand("~/.vim/swap//")
opt.backup = true
opt.undodir = vim.fn.expand("~/.vim/undodir//")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.selection = "inclusive"
opt.mouse = "a"
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.guicursor = "n:block-blinkwait700-blinkoff400-blinkon250,v:block,i:ver25-blinkwait700-blinkoff400-blinkon250"
opt.encoding = "UTF-8"
opt.showmode = true
