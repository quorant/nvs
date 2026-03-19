local autocmd_group = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

-- Makes each tab have its own working directory
--
-- vim.api.nvim_create_autocmd("TabEnter", {
--   callback = function()
--     if vim.t.cwd then
--       vim.cmd("tcd " .. vim.t.cwd)
--     end
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("DirChanged", {
--   callback = function()
--     vim.t.cwd = vim.fn.getcwd()
--   end,
-- })

-----------------------------

-- Stores directory history


-----------------------------

-- The following is supposed to use relative numbers whenever not in command 
-- mode, and switch to absolute line numbers in command mode.
-- It *mostly* works, but calling redraw makes other commands like <leader>b
-- not work properly.
--
-- vim.api.nvim_create_autocmd({"CmdlineEnter"}, {
--   callback = function()
--     vim.wo.relativenumber = false
--     vim.wo.number = true
--     if vim.fn.getcmdline() == "" then
--       vim.cmd("redraw")
--     end
--     -- vim.cmd("redraw")
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({"CmdlineLeave"}, {
--   callback = function()
--     vim.wo.relativenumber = true
--     vim.wo.number = true
--     if vim.fn.mode(1) == 'c' then
--       vim.cmd("redraw")
--     end
--     -- vim.cmd("redraw")
--   end,
-- })

-----------------------------
