-- ABOUTME: LSP configuration for CSS/SCSS/LESS
local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
    cmd = { 'vscode-css-language-server', '--stdio' },
    filetypes = { 'css', 'scss', 'less' },
    root_markers = { 'package.json', '.git' },
    capabilities = capabilities,
    settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true }
    }
}
