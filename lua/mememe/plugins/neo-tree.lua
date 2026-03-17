return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      sources = { "filesystem", "buffers", "git_status" },
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
      filesystem = {
        filtered_items = {
          -- visible = true,      -- Show hidden files
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = true,   -- Highlight current file
        use_libuv_file_watcher = true,
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_event",
          handler = function()
            vim.opt_local.number = true
          end,
        },
      },
      filesystem = {
        hijack_netrw_behavior = "open_current",  -- Opens Neo-tree in current window like netrw
      },
      git_status = {
        window = {
          position = "float",
        },
      },
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["H"] = "noop",
          ["<leader>h"] = "toggle_hidden",
        },
      },
    })
    vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>r", ":Neotree reveal<CR>", { desc = "At current file, toggle file explorer" })
  end,
}
