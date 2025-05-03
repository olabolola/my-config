return {
  'neovim/nvim-lspconfig',
  -- add mason-lspconfig as a dependency so it’s loaded before this
  dependencies = { 'williamboman/mason-lspconfig.nvim' },

  config = function()
    local lspconfig        = require('lspconfig')
    local mason_lspconfig  = require('mason-lspconfig')

    -- 1) shared on_attach for keymaps, autocmds, etc.
    local on_attach = function(client, bufnr)
      local bufmap = function(keys, fn, desc)
        vim.keymap.set('n', keys, fn, { buffer = bufnr, desc = desc })
      end

      bufmap('gd', vim.lsp.buf.definition,     'Go to definition')
      bufmap('K',  vim.lsp.buf.hover,          'Hover documentation')
      bufmap('<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {desc = "View all references"})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "View all code actions"})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {desc = "Rename a reference"})

      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd('BufWritePre', {
          buffer  = bufnr,
          callback = vim.lsp.buf.format,
        })
      end
    end

    -- 2) shared capabilities (for nvim-cmp later)
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- 3) tell mason-lspconfig to call this handler for every installed server
    mason_lspconfig.setup_handlers {
      -- default handler (for any server without a custom entry)
      function(server_name)
        lspconfig[server_name].setup {
          on_attach    = on_attach,
          capabilities = capabilities,
        }
      end,
      ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup {
          on_attach    = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                disable = { "missing-fields" },
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
              },
              telemetry = { enable = false },
            },
          },
        }
      end,

      ["pyright"] = function()
        lspconfig.pyright.setup {
          on_attach    = on_attach,
          capabilities = capabilities,
          settings = {
            python = {
              analysis = {
                typeCheckingMode     = "basic",
                autoSearchPaths      = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        }
      end,

    }
  end,
}

