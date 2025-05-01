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
        -- must be EXACTLY the lspconfig server name:
        ensure_installed    = { "gopls", "pywright", "lua_ls", "sqls", "terraformls"},
        automatic_installation = true,
      })
    end,
  },
}

