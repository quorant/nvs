local autocmd_group = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

-- Makes each tab have its own working directory
vim.t.cwd = vim.t.cwd or vim.fn.getcwd()

-- Update tab cwd when directory changes
vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    vim.t.cwd = vim.fn.getcwd()
  end,
})

-- Set tab cwd when entering a tab
vim.api.nvim_create_autocmd("TabEnter", {
  callback = function()
    if vim.t.cwd then
      vim.cmd("tcd " .. vim.t.cwd)
    end
  end,
})

-- When opening a new file, set tab cwd to its directory
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local file_path = vim.fn.expand("%:p")
    if file_path ~= "" then
      local file_dir = vim.fn.fnamemodify(file_path, ":h")
      vim.t.cwd = file_dir
      vim.cmd("tcd " .. file_dir)
    end
  end,
})

-----------------------------

vim.api.nvim_create_autocmd("SessionLoadPost", {
  callback = function()
    -- Get all buffers
    local buffers = vim.api.nvim_list_bufs()
    
    for _, bufnr in ipairs(buffers) do
      if vim.api.nvim_buf_is_valid(bufnr) then
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
        
        -- Kill any neo-tree buffer
        if bufname:match("neo%-tree") or buftype == "neo-tree" then
          pcall(vim.api.nvim_buf_delete, bufnr, { force = true })
        end
      end
    end
  end,
})

-----------------------------

-- The following is supposed to use relative numbers whenever not in command 
-- mode, and switch to absolute line numbers in command mode.
-- It *mostly* works, but calling redraw makes other commands like <leader>b
-- not work properly.

vim.api.nvim_create_autocmd({"CmdlineEnter"}, {
  callback = function()
    vim.wo.relativenumber = false
    vim.wo.number = true
    vim.cmd("redraw")
  end,
})

vim.api.nvim_create_autocmd({"CmdlineLeave"}, {
  callback = function()
    vim.wo.relativenumber = true
    vim.wo.number = true
    vim.cmd("redraw")
  end,
})

-----------------------------
