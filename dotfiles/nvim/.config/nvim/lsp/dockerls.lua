-- ABOUTME: LSP configuration for Dockerfiles
local capabilities = require('cmp_nvim_lsp').default_capabilities()
return {
    cmd = { 'docker-langserver', '--stdio' },
    filetypes = { 'dockerfile' },
    root_markers = { 'Dockerfile', '.git' },
    capabilities = capabilities,
    settings = {
        docker = {
            languageserver = {
                formatter = {
                    ignoreMultilineInstructions = true,
                },
            },
        },
    },
}
