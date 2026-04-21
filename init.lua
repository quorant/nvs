vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("mememe.lazy")

require("mememe.core.options")
require("mememe.core.keymaps")
require("mememe.core.colors")
require("mememe.core.autocmds")
require("mememe.lsp")

vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

-- vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
-- vim.opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
