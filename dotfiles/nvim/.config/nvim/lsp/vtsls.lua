-- ABOUTME: LSP configuration for TypeScript/JavaScript using vtsls
local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
    cmd = { 'vtsls', '--stdio' },
    filetypes = { 
        'javascript', 
        'javascriptreact', 
        'javascript.jsx',
        'typescript', 
        'typescriptreact', 
        'typescript.tsx'
    },
    root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
    capabilities = capabilities,
    settings = {
        typescript = {
            inlayHints = {
                parameterNames = { enabled = 'all' },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
            }
        },
        javascript = {
            inlayHints = {
                parameterNames = { enabled = 'all' },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
            }
        }
    }
}
