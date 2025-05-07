return {
  {
    "williamboman/mason.nvim",
    -- explicitly call its setup so Lazy knows to run it
    config = function()
      require("mason").setup()
    end,
  },
}

