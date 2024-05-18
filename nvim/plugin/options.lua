local opt = vim.opt

opt.inccommand = "split"

-- Search is nice like this
opt.smartcase = true
opt.ignorecase = true

-- Must have
opt.number = true
opt.relativenumber = true

-- personal pref
opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"

-- because I close nvim too many times on accident
opt.shada = { "'10", "<0", "s10", "h" }

opt.clipboard = "unnamedplus"

-- Don't have `o` add a comment

opt.formatoptions:remove "o"
