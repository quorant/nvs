return {
  "refractalize/oil-git-status.nvim",
  dependencies = { "stevearc/oil.nvim" },
  config = function()
    require("oil-git-status").setup({
      update_on_write = true,
      update_on_bufenter = true,
    })
  end,
}
