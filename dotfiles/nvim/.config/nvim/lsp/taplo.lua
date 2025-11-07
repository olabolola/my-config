-- ABOUTME: LSP configuration for TOML files
local capabilities = require('cmp_nvim_lsp').default_capabilities()
return {
    cmd = { 'taplo', 'lsp', 'stdio' },
    filetypes = { 'toml' },
    root_markers = { 'Cargo.toml', 'pyproject.toml', '.git' },
    capabilities = capabilities,
    settings = {
        evenBetterToml = {
            schema = {
                enabled = true,
                -- Provides schema validation for common TOML files
                associations = {
                    ['^Cargo\\.toml$'] = 'taplo://Cargo.toml',
                    ['^pyproject\\.toml$'] = 'taplo://pyproject.toml',
                },
            },
        },
    },
}
