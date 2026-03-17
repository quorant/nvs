return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  lazy = false,
  opts = {
    dir = vim.fn.stdpath("state") .. "~/sessions/",   -- add any custom options here
  },
  vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end),

  -- select a session to load
  vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end),

  -- load the last session
  vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end),

  -- stop Persistence => session won't be saved on exit
  vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end),
}
