-- ABOUTME: Formatter for HTML, CSS, JS, JSON, etc.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
    cmd = { 'prettierd' },
    filetypes = { 
        'html', 
        'css', 
        'scss', 
        'javascript', 
        'javascriptreact', 
        'typescript', 
        'typescriptreact',
        'json',
        'markdown'
    },
    root_markers = { '.prettierrc', '.prettierrc.json', '.prettierrc.js', 'package.json', '.git' },
    capabilities = capabilities,
}
