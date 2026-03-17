local opt = vim.opt

opt.rtp:append(vim.fn.stdpath("data") .. "/site")

-- line wrapping 
opt.wrap = false

-- line numbers
opt.number = true
opt.relativenumber = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace 
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true


opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true
opt.autoindent = true

opt.laststatus = 2
opt.ruler = true
opt.showcmd = true
opt.showmatch = true
opt.cursorline = true

opt.mouse = "a"

opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undo")  -- reuse your existing dir

opt.termguicolors = true          -- almost always good
opt.background = "dark"

-- Statusline (basic – can improve later with lualine)
-- opt.statusline = "%F%m%= %y %l/%L %c"

-- Other QoL
opt.hidden = true
opt.updatetime = 100              -- faster gitgutter / cursorhold
opt.signcolumn = "yes"            -- always show for git signs
opt.scrolloff = 5                 -- optional, but nice
