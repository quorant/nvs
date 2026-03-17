return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "" },
      change = { text = "~" },
      delete = { text = "-" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    signcolumn = true,  -- always show
  },
  -- Optional: keymaps for hunk navigation/staging
  config = function(_, opts)
    require("gitsigns").setup(opts)
    local gs = package.loaded.gitsigns

    vim.keymap.set("n", "]c", gs.next_hunk, { desc = "Next Hunk" })
    vim.keymap.set("n", "[c", gs.prev_hunk, { desc = "Prev Hunk" })
    vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk" })
    vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
  end,
}
