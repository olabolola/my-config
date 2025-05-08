return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "ellisonleao/gruvbox.nvim",
    name   = "catppuccin",
    config = function()
      require("gruvbox").setup{}
    end,
  },
}
