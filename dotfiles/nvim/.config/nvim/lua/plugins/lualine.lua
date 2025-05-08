return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional
  config = function()
    require("lualine").setup({
      options = { theme = "iceberg" },
    })
  end,
}
