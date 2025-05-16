return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      natural_order = "fast",
    },
    columns = { "icon" },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<cmd>Oil --float<CR>", desc = "Open parent directory in Oil" },
  },
}

