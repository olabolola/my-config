return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require('lspconfig')

    -- Example for Python: use pyright
    lspconfig.pyright.setup({})

    -- You can add more languages later here easily!
  end
}

