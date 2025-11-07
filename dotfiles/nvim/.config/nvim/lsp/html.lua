-- ABOUTME: LSP configuration for HTML
local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
    cmd = { 'vscode-html-language-server', '--stdio' },
    filetypes = { 'html' },
    root_markers = { 'package.json', '.git' },
    capabilities = capabilities,
    settings = {}
}
