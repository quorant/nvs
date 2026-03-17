local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Explorer
map("n", "<leader>pv", vim.cmd.Ex, opts)

-- Wrapped lines
map({ "n", "x" }, "j", "gj", opts)
map({ "n", "x" }, "k", "gk", opts)

-- Insert mode navigation - multiple options
-- Line start/end
-- vim.keymap.set("i", "<D-Left>", "<C-o>0", { desc = "Jump to start of line" })  -- Cmd+Left
vim.keymap.set("i", "<C-S-Left>", "<C-o>0", { desc = "Jump to start of line" })
-- vim.keymap.set("i", "<D-Right>", "<C-o>$", { desc = "Jump to end of line" })   -- Cmd+Right
vim.keymap.set("i", "<C-S-Right>", "<C-o>$", { desc = "Jump to start of line" })

-- File start/end
-- vim.keymap.set("i", "<D-Up>", "<C-o>gg", { desc = "Jump to start of file" })   -- Cmd+Up
vim.keymap.set("i", "<C-S-Up>", "<C-o>gg", { desc = "Jump to start of file" })   -- Alt+Up
-- vim.keymap.set("i", "<D-Down>", "<C-o>G", { desc = "Jump to end of file" })    -- Cmd+Down
vim.keymap.set("i", "<C-S-Down>", "<C-o>G", { desc = "Jump to end of file" })    -- Alt+Down

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Tab navigation
map("n", "H", "gT", opts)
map("n", "L", "gt", opts)

for i = 1, 9 do
  map("n", "<leader>" .. i, i .. "gt", opts)
end

-- Clipboard (system +)
map({ "n", "v" }, "<leader>y", [["+y]], opts)
map("n", "<leader>Y", [["+Y]], opts)

-- Buffers
map("n", "<leader>b", "<Cmd>ls<CR>:b<Space>", opts)
-- vim.keymap.set("n", "<leader>b", function()
--   vim.cmd("ls")  -- show buffers
--   vim.cmd("b ")  -- simulate typing :b<Space> and Enter
-- end, opts)
map("n", "<leader><Tab>", ":b#<CR>", opts)
map("n", "<leader>n", ":bnext<CR>", opts)
map("n", "<leader>p", ":bprevious<CR>", opts)

-- Splits and tabs
map("n", "<leader>sh", ":sb%<CR>", opts)
map("n", "<leader>sv", ":vert sb%<CR>", opts)
map("n", "<leader>t", ":tab sb%<CR>", opts)

-- Clear search highlight
map("n", "<leader>/", ":nohlsearch<CR>", opts)

-- Resize windows
vim.keymap.set("n", "<C-left>", "<cmd>vertical resize -1<CR>")  -- Narrow current split
vim.keymap.set("n", "<C-right>", "<cmd>vertical resize +1<CR>")  -- Widen current split
vim.keymap.set("n", "<C-up>", "<cmd>resize +1<CR>")           -- Heighten current split
vim.keymap.set("n", "<C-down>", "<cmd>resize -1<CR>")           -- Shorten current split

-- Rotate windows
vim.keymap.set("n", "<C-w>r", "<C-w>r", { desc = "Rotate windows" })
vim.keymap.set("n", "<C-w>x", "<C-w>x", { desc = "Exchange with next window" })

-- Swap lines copy lines up and down
vim.keymap.set('n', '<A-Down>', ':m .+1<CR>==', opts) -- swap with line below
vim.keymap.set('n', '<M-Down>', ':m .+1<CR>==', opts) -- swap with line below
vim.keymap.set('n', '<A-Up>',   ':m .-2<CR>==', opts) -- swap with line above 
vim.keymap.set('n', '<M-Up>',   ':m .-2<CR>==', opts) -- swap with line above 
vim.keymap.set('n', '<A-S-Down>', 'yyp', opts)  -- copy line down
vim.keymap.set('n', '<A-S-Up>',   'yyP', opts)  -- copy line up

-- swap selection (entire lines)
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', '<M-Down>', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv", opts)
vim.keymap.set('v', '<M-Up>', ":m '<-2<CR>gv=gv", opts)

-- copy selection (entire lines)
vim.keymap.set('v', '<A-S-Down>', ":<C-u>'<,'>yank | '>put<CR>gv", opts)
vim.keymap.set('v', '<A-S-Up>', ":<C-u>'<,'>yank | '<put!<CR>gv", opts)
