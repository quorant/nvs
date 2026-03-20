return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      update_focused_file = {
        enable = true,
        update_root = false,
      },
    })
    local api = require("nvim-tree.api")
    vim.keymap.set("n", "<C-p>", api.tree.toggle)
    vim.keymap.set("n", "<leader>e", function()
      if api.tree.is_visible() then
        api.tree.focus()
      else
        api.tree.open()
        api.tree.find_file({focus = true})
      end
    end)
  end,
}
