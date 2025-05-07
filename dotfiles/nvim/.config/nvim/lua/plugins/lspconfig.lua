return {
  'neovim/nvim-lspconfig',
  dependencies = { 'williamboman/mason-lspconfig.nvim' },

  config = function()
    local lspconfig = require('lspconfig')
    local mason_lspconfig = require('mason-lspconfig')

    -- 1) shared on_attach for keymaps, autocmds, etc.
    local on_attach = function(client, bufnr)
      local bufmap = function(keys, fn, desc)
        vim.keymap.set('n', keys, fn, { buffer = bufnr, desc = desc })
      end

      bufmap('gd', vim.lsp.buf.definition, 'Go to definition')
      bufmap('K', vim.lsp.buf.hover, 'Hover documentation')
      bufmap('<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "View all references" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "View all code actions" })

      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd('BufWritePre', {
          buffer = bufnr,
          callback = function() vim.lsp.buf.format { async = true } end, -- Added async = true for potentially better performance
        })
      end
    end

    -- 2) shared capabilities (for nvim-cmp later)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


    -- 3) tell mason-lspconfig to use our handlers and ensure servers are installed
    mason_lspconfig.setup {
      -- A list of servers to ensure are installed. Mason will install them if they aren't.
      -- Add all the LSPs you use here.
      ensure_installed = {
        "lua_ls",
        "pyright",
        "jsonls",
        "yamlls",
        "gopls",
        "bashls",
        "sqls"
        -- "tsserver", -- for example
      },
      automatic_installation = true,
      -- This is where you define the handlers for LSP servers
      handlers = {
        -- Default handler (for any server without a custom entry below)
        function(server_name)
          lspconfig[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
          }
        end,

        -- Custom handler for lua_ls
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup { -- Use lspconfig.lua_ls directly here
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  disable = { "missing-fields" },
                  globals = { "vim" },
                },
                telemetry = { enable = false },
                workspace = {
                  checkThirdParty = false, -- Can speed up loading if you don't use external libs in your Neovim config that need workspace checking
                }
              },
            },
          }
        end,

        -- Custom handler for sql
        ["sqls"] = function()
          lspconfig.sqls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "sql" },
            settings = {
              sql = {
                connection = {
                  driver = "postgresql",
                }
              }
            }
          }
        end,

        -- Custom handler for pyright
        ["pyright"] = function()
          lspconfig.pyright.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              python = {
                analysis = {
                  typeCheckingMode = "basic",
                  autoSearchPaths = true,
                  useLibraryCodeForTypes = true,
                  -- reportMissingImports = "warning", -- Or "error" / "none"
                  -- reportUnusedImport = "warning", -- Or "error" / "none"
                },
              },
            },
          }
        end,
      }
    }
  end,
}
