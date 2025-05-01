return {
  "stevearc/oil.nvim",
  opts = {
    -- Optional configuration
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<cmd>Oil<CR>", desc = "Open parent directory in Oil" },
  },
}

