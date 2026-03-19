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
        -- commands = {
        --   delete = function(state)
        --     local inputs = require("neo-tree.ui.inputs")
        --     local path = state.tree:get_node().path
        --     local msg = "Are you sure you want to trash " .. path
        --     inputs.confirm(msg, function(confirmed)
        --       if not confirmed then return end
        --
        --       vim.fn.system { "trash", vim.fn.fnameescape(path) }
        --       require("neo-tree.sources.manager").refresh(state.name)
        --     end)
        --   end,
        --
        --   -- over write default 'delete_visual' command to 'trash' x n.
        --   delete_visual = function(state, selected_nodes)
        --     local inputs = require("neo-tree.ui.inputs")
        --
        --     -- get table items count
        --     function GetTableLen(tbl)
        --       local len = 0
        --       for n in pairs(tbl) do
        --         len = len + 1
        --       end
        --       return len
        --     end
        --
        --     local count = GetTableLen(selected_nodes)
        --     local msg = "Are you sure you want to trash " .. count .. " files ?"
        --     inputs.confirm(msg, function(confirmed)
        --       if not confirmed then return end
        --       for _, node in ipairs(selected_nodes) do
        --         vim.fn.system { "trash", vim.fn.fnameescape(node.path) }
        --       end
        --       require("neo-tree.sources.manager").refresh(state.name)
        --     end)
        --   end,
        -- }
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
