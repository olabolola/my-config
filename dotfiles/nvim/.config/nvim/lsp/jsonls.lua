local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
    cmd = { 'vscode-json-language-server', '--stdio' },
    filetypes = { 'json', 'jsonc' },
    root_markers = { '.git' },
    capabilities = capabilities,
    settings = {}
}
