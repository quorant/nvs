return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },  -- lazy-load on file open
  config = function()
    local parser_install_dir = vim.fn.stdpath("data") .. "/site"
    vim.fn.mkdir(parser_install_dir, "p")

    require("nvim-treesitter.config").setup({
      parser_install_dir = parser_install_dir,
      ensure_installed = { "python", "javascript", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "json"},
      auto_install = false,

      highlight = {
        enable = true,
        -- disable = { "c", "rust" },
      },

      indent = { enable = true },

      -- incremental_selection = { enable = true },
      -- textobjects = { enable = true },
    })
  end,
}
