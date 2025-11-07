-- ABOUTME: LSP configuration for Ruff (Python linter/formatter)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
    capabilities = capabilities,
    init_options = {
        settings = {
            -- Enable formatting
            format = {
                preview = true,
            },
        },
    },
}
