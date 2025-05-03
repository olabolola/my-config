return {
  {
    "williamboman/mason.nvim",
    -- explicitly call its setup so Lazy knows to run it
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed    = { "gopls", "pyright", "lua_ls", "terraformls"},
        automatic_installation = true,
      })
    end,
  },
}

