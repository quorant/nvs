return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- for file icons
  lazy = false,
  config = function()
    require("oil").setup({

      default_file_explorer = false,

      keymaps = {
        ["<C-h>"] = false,  -- disable so it doesn't conflict with your window nav
        ["<C-l>"] = false,
      },

      view_options = {
        show_hidden = true,
      },

      win_options = {
        signcolumn = "yes:2",
      },

      -- Float window settings (if you want a floating window instead of replacing buffer)
      float = {
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
      },

      delete_to_trash = true
    })

  end,
}
