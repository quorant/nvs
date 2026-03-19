return {
	"olimorris/persisted.nvim",
	opts = {
		-- automatically load session when in dir with one
		autoload = true,
		save_dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
		saver = {
			-- Exclude neo-tree buffers from being saved
			excluded_ft = { "neo-tree", "neo-tree-popup" },
			excluded_bt = { "neo-tree", "neo-tree-popup" },
		},
		-- Also exclude neo-tree from autosave
		autosave = {
			excluded_ft = { "neo-tree", "neo-tree-popup" },
			excluded_bt = { "neo-tree", "neo-tree-popup" },
		},
	},
	config = function(_, opts)
		-- function to delete only internal Neo-tree buffers
		local function delete_neotree_buffers()
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				local ft = vim.api.nvim_buf_get_option(buf, "filetype")
				-- delete only neo-tree buffers that are not real files
				if vim.api.nvim_buf_is_loaded(buf) and name:match("^neo%-tree filesystem") then
					vim.api.nvim_buf_delete(buf, { force = true })
				end
			end
		end

		require("persisted").setup(vim.tbl_extend("force", opts, {
			after_load = function()
				delete_neotree_buffers()
				-- reopen Neo-tree automatically after session loads
				pcall(require("neo-tree.command").execute, { toggle = false })
			end,
		}))

		-- keymaps
		vim.keymap.set("n", "<leader>qf", "<cmd>Telescope persisted<CR>", { desc = "Telescope persisted" })
		vim.keymap.set("n", "<leader>qs", "<cmd>Persisted save<CR>", { desc = "Save session" })
		vim.keymap.set("n", "<leader>ql", "<cmd>Persisted load_last<CR>", { desc = "Load last session" })
	end,
}
