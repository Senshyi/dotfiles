local opt = vim.opt

opt.inccommand = "split"

-- Search is nice like this
opt.smartcase = true
opt.ignorecase = true

-- For resizing splits etc until I make keybinds
opt.mouse = "a"

opt.showmode = false
opt.breakindent = true

opt.undofile = true

-- Must have
opt.number = true
opt.relativenumber = true

-- personal pref
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 8
opt.cursorline = true
-- this shows trailing spaces tabs etc
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.signcolumn = "yes"
opt.hlsearch = true

-- because I close nvim too many times on accident
opt.shada = { "'10", "<0", "s10", "h" }

opt.clipboard = "unnamedplus"

-- Don't have `o` add a comment
opt.formatoptions:remove "o"
